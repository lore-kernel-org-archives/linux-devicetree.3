Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795102698;
	b=OFzUsXLHqsaximg4iUqs+z28RhiUiIMfMsTtkNnmwG554QacTgRFr+J5vS+mG0ewcqn7
	 2oA8CxuGekJAzwFLw2d+XY+bI9CfB3kfqWGRqKNxMC4A9n0FseNOcA4gmjKirOwbGofMm
	 r0DU+HoZIYfjDXIHTR4vXHaSR28we3QJGsD52QMTqr91QMQQl7Bv7Fo4H7/SZsMlf/vfK
	 0T5KT8JkgcviafN9UAyh1U77luyNYMkFKJRPF0iB4dE3fvTW+iulsy9X3YYhBlv6TONRC
	 e13xRO3H6j34i4eqnLy3p0gGrXntXp451+aTcLdGpyg5hyCOfrMjYQQd6WAFwMhe1dQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102698;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=drywv9X/QD6GTy9pDjLa5PABODeuHIP48aMyKh24UjM=;
	b=SnFF1ONH4teCZS81tBWPO+2ymIFtqjKyOLT9EcxYAXJltLLxYGszRQzgUA+zMBKZnmL0
	 SGN0EVHBGSKILuNUwwfqMYSYSuswkQzYlP+FgCXoiyDJFeNnxuUZQaYPxSYWrHjd9R+Sx
	 bAQ4omAlvdSLDDLrZrjMsKkth8CjlmQ2iiRF8erTBW0H/D1h+VpU30Bxjn/ekV47KYRlJ
	 KVQ0KrJTMW5l4nsVIKA1YpR5D6eaIJIH46xlULYAvA/Ye6qOGxZYAE/WbXHPJP1VLO7xE
	 oz1TaJWExp77/fBOfWJLnoovkKfIcaVAQCPAUXYoYnhnXrE2i6JwJFUKV2cIt8CvD3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=l9wqPPh5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804D8606A32C
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 15:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 804D8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=l9wqPPh5
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dee593f18so2386014f8f.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 07:38:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795102693; cv=none;
        d=google.com; s=arc-20260327;
        b=lFpoPCKjf3G8+aib3kVkpISw8CFZZ3dn1fWJRzDgvuD4HzviBpgWGMGJSsznV/Mp5I
         TMWjT2YZWynXHj+2KCM09/WKznp7ZIismSLDrL4xkeRt+t0rHdSmK74BVTW8tZx7GvVQ
         Dir2zcfsGgCjDSW3acfrCi9q0NAFMuLlouh8VetjZ8NILuYpxfepnxUOMCj2W8KhsE5i
         Cw35s/xZrsNiqSvrJ+77MXopoZHGHFG0LeCDl/0B4oOQsquVuY6pUrsKG/pkVdB2inh/
         u9wJSu/KgoQTf4d0Q3M8m/F+zC0wL9dJeBky0ctPXFrlpqazymh5IaMn7mE2ypI5hBiu
         qL3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=drywv9X/QD6GTy9pDjLa5PABODeuHIP48aMyKh24UjM=;
        fh=P0+l8nx+pmZQm9V+fc/vexa4+UyVd9FAjlK+OycdTYc=;
        b=gKM3Mpm1bzRddOyY9e99AhpPba67AgQ448VBZgGavPSyiUgFHMM+WjAtXJzrh3754X
         ijJpNWG/8DibANh2BbLLcNYSqKkddYTbMmJkozl8gjPAFOzVXBa1ePU8rvlPXebm64rX
         VRltvqyEbOioVPMwo4qH0Wd3QeC9nOforNHQAjbMWSjlayuPAEQGVv1xsAdRUNKQAemq
         3SXeEP9GuaPBgu8Km/hOOjtbdMOQBSZ6LF9iormvyJ86qIs6Dsxc+7JP7TQpNK33PWma
         qfV1s2b7wudAe2cr/WmvHzGzmLDZFIZZX7CEvz2h4dNFuVx7cJQvChMViTOJ7LEdg1On
         OjUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795102693; x=1795707493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=drywv9X/QD6GTy9pDjLa5PABODeuHIP48aMyKh24UjM=;
        b=l9wqPPh5HAOPk4NvNfOoXCp9UFZt0jF4fJuFzlhGeawYtptb+gtWbzOsk933HOggcV
         gmrWI40zgGAVf0b2Rc4WuSWSxmqNANkfDkkQ8pMG0CjWEER+nI5FHtMkKixmM+9lkucI
         g3gMbdKtaU8mAkgC/MxW6muRBq27+stByNyKvhaqUsvnVfuISB8/r8YexQ+PeMrcncvM
         vQZRiRm1uTB1Gvgkogdwdaw7Vc1Trjj/d1iulvsvNKXFE9cntCxgMvnRZZUN/z+dLJCU
         9478GoyQiTkG7QDOI+ATjIQqiYR4wh41NerHKnqzQYvskYfHCSBPBqeDZ5YJZ/jALlde
         gRHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102693; x=1795707493;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=drywv9X/QD6GTy9pDjLa5PABODeuHIP48aMyKh24UjM=;
        b=VxsvBYlFnYH29caGxSBdpPyXcKghpxfSyse3dC/Wb+Vz5EMgCJrF5GFFKaCfO4jbWr
         JNA0Qljtsj6UVy/x5KAVU24M5/B36E7H+h9msYFJk8LvbJ/Vzkq+3qMd8PhkyLXTqbo9
         etq9fus8cBKmmuKAt8lFhPlt/yf5tGiObFlE/sTafieM3I7RGvqV9qpnzfC4kdreom1U
         qHunfeykmHNqxzozkvDBnAvZEjYe0yIY1gv1q0ELXmoQmwwnt0ch4XSeQqXvF4CKAC13
         Oj5sLK6sBrQL9LnLzC4TL1uyTYjde0Wt/Nw7/Vtb/scaZV9FvrXim8SdDiDErBM8k+5s
         koiQ==
X-Forwarded-Encrypted: i=1; AL+hErEce12YZDHBEI69CJVAfEakhmncHCaxPBjCkZDQ9mMW85+gaVEAajpMlT7KF9CiYT4+7NUeQJnYHNXG@vger.kernel.org
X-Gm-Message-State: APuU4Z+OWXYz5IKeL/mW22UwOEFloTmvTHXeRojbCLgjQk3SGce50RFJ
	pOvh4pm4DtZkLbsIgZgUeygc+qoMwMfshtg0CCT2uriwBB1upgsbjYx/bhhh4XgdMx9qnONyUdK
	tcBdy4s0h+BlWOWLuDgioEYlurTfd3qV1tt8JlOun9PHTchFGji5CGxVxsA==
X-Gm-Gg: AZFdTZfd+scMRMiEQpeEV8NjBr8TK+cgv4HZ44dQ5YYI3E+TaZUHqZw6yt7u6BNd0hR
	R6VUn0VM75i7C2dmr8dRdg2PstWOrtxrCwEGp79W2q4vevkJC3KGDugAVDLitTM0cQPL8a4tMlZ
	RHMgM6QuSyhWPNnudRD47motovIbcYLChrOjMPJV4klAPvLiWFfYcb/zC3zGAgeEVzuu/YP79Mp
	CisF1UiyqNwImSiKcboKG9tDJf9P1fzbpBO5o9rg/hte4ABIpU3mB3qj4Uh8XfGCyaTDNEUDjsc
	SK+1s1MMrgPw42alftF6pzw1OPI1Jy+L8o1nK9qwuZkHyADJ3RSgtSBjbXEK4ULrXbP0l8tMM51
	UMI6CNux0Y4BGGHZXVgWn+hsgKaZ0vnggCC7Ji+wDGZo2bO1+HP5tS/sa9Dvr27loWUDuW0APBB
	6Q7oa6NoAPknnjTGxgQkcd/qaUra4HD9KPJhdrmitwKwclizwNQpvNKnrt
X-Received: by 2002:adf:e009:0:20b0:490:1881:80ec with SMTP id
 ffacd0b85a97d-4a63a895742mr10073341f8f.36.1795102692730; Thu, 19 Nov 2026
 07:38:12 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118095053.3871267-1-vikram.singh3@oss.qualcomm.com> <20261118095053.3871267-8-vikram.singh3@oss.qualcomm.com>
In-Reply-To: <20261118095053.3871267-8-vikram.singh3@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 19 Nov 2026 21:08:01 +0530
X-Gm-Features: Aa3M54qqVopLHoNkItX81APze_rfhpoAK0QlJ8DY6gdjSieSVn8liCJp7Smx0no
Message-ID: <CAAhSdy3KUqSqERnw6khG13mXKcaCf3UeG+FqQAZzeeNZ7S7GfQ@mail.gmail.com>
Subject: Re: [PATCH v5 7/7] dt-bindings: riscv: add Sxctr ISA extension description
To: Vikram Singh <vikram.singh3@oss.qualcomm.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, atishp@rivosinc.com, anup.patel@oss.qualcomm.com, 
	will@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	beeman@rivosinc.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Conor Dooley <conor@kernel.org>, 
	devicetree@vger.kernel.org, Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 3:21=E2=80=AFPM Vikram Singh
<vikram.singh3@oss.qualcomm.com> wrote:
>
> Add the S[m|s]ctr ISA extension description.
>
> Co-developed-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
> Signed-off-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
> Signed-off-by: Vikram Singh <vikram.singh3@oss.qualcomm.com>
> Link: https://lore.kernel.org/r/20261106173942.3175069-8-vikram.singh3@os=
s.qualcomm.com
> Signed-off-by: Anup Patel <anup@brainfault.org>

As mentioned in PATCH1, drop the "Link:" and the subsequent
"Signed-off-by:" lines.

> ---
>  .../devicetree/bindings/riscv/extensions.yaml | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 79491ef8f86a..dde2f28cfda5 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -202,6 +202,13 @@ properties:
>              mechanism in M-mode as ratified in the 20240326 version of t=
he
>              privileged ISA specification.
>
> +        - const: smctr
> +          description: |
> +            The standard Smctr supervisor-level extension for the machin=
e mode
> +            to enable recording limited branch history in a register-acc=
essible
> +            internal core storage as ratified at commit 9c87013 ("Merge =
pull
> +            request #44 from riscv/issue-42-fix") of riscv-control-trans=
fer-records.
> +
>          - const: smmpm
>            description: |
>              The standard Smmpm extension for M-mode pointer masking as
> @@ -263,6 +270,13 @@ properties:
>              mechanism in S-mode as ratified in the 20240326 version of t=
he
>              privileged ISA specification.
>
> +        - const: ssctr
> +          description: |
> +            The standard Ssctr supervisor-level extension for recording =
limited
> +            branch history in a register-accessible internal core storag=
e as
> +            ratified at commit 9c87013 ("Merge pull request #44 from
> +            riscv/issue-42-fix") of riscv-control-transfer-records.
> +
>          - const: ssnpm
>            description: |
>              The standard Ssnpm extension for next-mode pointer masking a=
s
> @@ -1189,6 +1203,21 @@ properties:
>              - contains:
>                  const: zicntr
>
> +      # Smctr depends on Sscsrind
> +      - if:
> +          contains:
> +            const: smctr
> +        then:
> +          contains:
> +            const: sscsrind
> +      # Ssctr depends on Sscsrind
> +      - if:
> +          contains:
> +            const: ssctr
> +        then:
> +          contains:
> +            const: sscsrind
> +
>  allOf:
>    # Zcf extension does not exist on rv64
>    - if:
> --
> 2.43.0
>

Otherwise, LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup
