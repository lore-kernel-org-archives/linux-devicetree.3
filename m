Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CB1351C35
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 19:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779130826; cv=pass; b=LAdKxpROrDgZoktDidquxMW9nbVrZ09YU0lbywc1H7DZjUVMnweJCwIfMwIzHjHEQhPwMbMejq7KW9nyzStsZ7vXovKf6bUCTstUCgMSz0AWcxVRjTmEdXA8aq38siAxGstUY29yTo9OM5Dgo02XqiJUvDVVIOVhrWK64QQzu5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779130826; c=relaxed/simple;
	bh=jqpLVtdaekwJwnvaQIwx+IWTuYaGV9QkqYaMYh2FdSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nUOLgiG/t54NyfneZsrM0MaILzRXQaAKeXXlwK8gyWiOnsWMsqzkc2rTW33aJ638Z5SQAw8XTSwIsg2HpRtZQMm0lwVGVzs7TjlWVQVpzcU3dI7KpJ4LReS3tQEWTSA5RrTUqaJPfJ2z40gMwHGxejQ1RgXI9AVsQ73sgqzc3fk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFdcSBec; arc=pass smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFdcSBec"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-482de4ef03aso2478363b6e.1
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 12:00:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779130823; cv=none;
        d=google.com; s=arc-20240605;
        b=cm6EN4OodEs+CcwISvuVl4E1oO3R3N14QV7JM7uZBJL/MkwIx2Oq8F1iHQrBh3KLS0
         jcY8jiiAvM/Ro8jtqzDArwk0cEYBquxUh4uKH4vWGod0btGPXT8cJfyNMOQ4QJ1g0wVK
         YQQ0gLuDnrJm/O10PSitS8daUhaLf8Et65P3V1/uiuvK0EJmhilZm2ijcdb5BjyAvLH1
         DLpWavi2GQcPpcXyhIT6hdO1d4obk5oBZirgZOGoR1N0tP0p57BBSj/R9n+lKzluWt0Y
         6fMu0RtURUxCtt7FYBUHSrRHJDvS806GAD+mR5ejZUT4JbnUJ3ihdDRBtrVCs99D2svg
         BktQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aKjYUNHanWZ9/vxOgUgSAaa1aIDsNs/cg6V/PaTm7D8=;
        fh=P8VbUDI797ZkDDBtfmTL/XhfQkEFqHFgwjerNR8cTME=;
        b=NPy02QbSATILXuMNR59ZeUSZ4xa1CA1PWLvzRB8o3fsLnedTdzBr+FQzx2V5Z1zGJo
         XWgGXwY8maMdFbGVgbnKJ7qX3R3cZRALynIPR0pOoXC3zQuGdikAfPdpQqcYzi6013vA
         qOoxxiEuOWHYy8hAoxoCUhMl2Eis/Ioj5dC49wWvzJfHm0bCFS2BRpNKUCcXgbJeUn98
         aD/W59yZthQJ2OwTy4ElW/vbh9ohPuXBh8ufSjFILZkmpIPc2izMRWH7H/iRTSX79omx
         bvsy0oAwS9qgDwtzjq2inxf5OMt3bM8disP7zv3lom6SLEHYEQH/xNTZH6qDvDqCsN0D
         +heg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779130823; x=1779735623; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKjYUNHanWZ9/vxOgUgSAaa1aIDsNs/cg6V/PaTm7D8=;
        b=mFdcSBecdDC+w38TxNaI6h/T57RRPub4cMg9RKg8k+bvNeD0QZOvkwx0VEGR9cldqG
         T3GnlmRcVoWgzVdpKZJLojdSXA5LIO5S1THzfuF8jZE7voMn+oDtRpQB0g99s+w02GU+
         nFi5gkD6VG/QlWY/AtWpV4ZYMKaB5gy+hxlzrhWz4OPf//NeLrZWRgdqBjShlUfpCela
         Dl7TpwlpCLpPMEdntUSGMVsNkhM3lpVx5C6bK3yqW95+INKGQ4PvzINh1LIuLjeYz8Gw
         nTzp7JefavDQrRFz6p6MnuC/ZdBdThMRXTftFC07qNjemeLR4qb8j9DiPEOW5jQ5SWn5
         +5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779130823; x=1779735623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aKjYUNHanWZ9/vxOgUgSAaa1aIDsNs/cg6V/PaTm7D8=;
        b=q+h17gmdJFsGWWYzUTh9b0sHJ8KY4byKTBml4UobGTmjM1w1gjwK/p3JTXNG9jMDvk
         5izMfIIIRyvHPQ4DQQPMJ43QhxE0AjXGA2sU+W4AMmkOddYnkPo57iDno2V2nexUgatV
         Iy5zAd4UMr4iBt/OxCoKPEYZcMnJq6uxuuLrv4Nqrx8UDSbxh5oTE2QOCygbuxyqQwCq
         oxjubuUpNza+iKxS6qEVGHvhfb/KJNsP3FQ4vlZByQdhHGp/gFx4ZJba6H2rAXatpy8R
         85ezNdZokMPBOhaAP4XM5W7VJxUk1CKeCzXYlKkP8pfdVuPN7Qq9vKQqlJATtZqt3AsE
         Xe6w==
X-Forwarded-Encrypted: i=1; AFNElJ/yjyMChQ7P/Es6niwZ5wZuBulZTEWuRNzhnCBGIaOeBT6HeKxxqKHySAxhPx/8SYqhGHDSRGjjAgX5@vger.kernel.org
X-Gm-Message-State: AOJu0YwT2ap1uFr1cuRvkuV9IFUEIoV/1VmUGQlINxZV7Xv9G2laD63D
	RwTbD/ApoPq7JsXrJPvaTP4kbp0nG/VponXw9WP8EfOwdgW0lRC2qp6QvJAWqJPsLt/p2oqSo5X
	qIWo8prgjb6P2i+DbiwtNHXEqeTLECQc=
X-Gm-Gg: Acq92OHWn6D5kxVuqWUA8IKkNWItNIyqnTVqBrEEPwvdLhWFJOlJ5R/db+l0/KAkIfv
	cBX5FeNixU59DXh0dqXQd4DseuMAIxm8Mp1P7CfbjDbJUyw6K+fVYCEpQ5O2t8f9ahjURFnlEWt
	aNQ0NAwxFRhTmmOJS2+YMUifQP8H0Glwn1VCR6mHkLIWYXroPYiXjIZl94nwiTdd+bl9Qv+PGid
	gCKtemEq8dgqvZMZNDpC78Zdl9huxOgmDC9ZiwL7SoCZPAOKnSzpBJSyPBzqF6fIreeT/DlcYTt
	beAE
X-Received: by 2002:a05:6808:148c:b0:470:d1f:de69 with SMTP id
 5614622812f47-482cba8d3b8mr11223043b6e.26.1779130823539; Mon, 18 May 2026
 12:00:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401125126.593254-1-mukesh.ojha@oss.qualcomm.com>
In-Reply-To: <20260401125126.593254-1-mukesh.ojha@oss.qualcomm.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 18 May 2026 14:00:11 -0500
X-Gm-Features: AVHnY4Jf_k30k-UwsPBwW36rpegtCw8gTY8KHt3VPyqvGlu8_35mtZ1i3se0sro
Message-ID: <CABb+yY0O1u0oWpDeiK7VTpfa5_BBcTQppjhhwUEDMSbwYBXvSw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mailbox: qcom: Add IPCC support for Hawi Platform
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 7:51=E2=80=AFAM Mukesh Ojha <mukesh.ojha@oss.qualcom=
m.com> wrote:
>
> Document the Inter-Processor Communication Controller on the Qualcomm
> Hawi Platform, which will be used to route interrupts across various
> subsystems found on the SoC.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/D=
ocumentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> index 7c4d6170491d..7dbc3ac6c5c9 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> @@ -25,6 +25,7 @@ properties:
>      items:
>        - enum:
>            - qcom,glymur-ipcc
> +          - qcom,hawi-ipcc
>            - qcom,kaanapali-ipcc
>            - qcom,milos-ipcc
>            - qcom,qcs8300-ipcc
> --
> 2.53.0
>
Applied to mailbox/for-next
Thanks
Jassi
