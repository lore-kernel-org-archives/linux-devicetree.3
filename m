Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795790235;
	b=wMZxjh7jXeAo0oHRnn/aPm12rjoONA7ftlNu+3iVTAp2ytqrR5ivu0fJ2SbzuywM73c+
	 ZFCFi73OBD3HjdfhpYHTONanr67unTjzvHhJbAOnRH4Zdq2at4Pf+Hyx22HqWapBh9kVz
	 e/YabGrczZ7QoWS/T4o0OWy1w4fpqjff47cmyZGiMs29K2TbP8xjRVW5hwK6Aqk0Yy8r7
	 kSjECI+sYw2aVRpRoxgWsidHSFzhKLopN7ZDjV4wa5ehu1Dle8+03gcZ81Ap/7vgjPRhT
	 y0WNDQR3KhWsh183hTXu/3VQlrcRwBJ9nbokUod2AXgTUG2wG9Mp75eZaSnVAiLIaFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790235;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tWNqqUhi+1+BXB18Sy8VdaElJpWatihymQrBKDZIAhs=;
	b=QYhAU1UDu+TFZ3Szzb58Ee17Pxf4t2Zfi1Yk704u0l10Qd5iObfCJcLxlXaczzkFS2Ez
	 7+ciyUA+oE4RDH+dGnwG13ABhljQGFxiakGH6s/MajuGTioW66+fDr0pUbDx/e2PQhlpx
	 gS8MNI4vQ6pGGygciE//dM+4ZqCcGnix/b+5FZEM8ik/xfbUvdbqCUMr7jZ3+PbW9u+d2
	 gDjeVkef66GR7x9HmXt2og7rJUDg74BMgQ97iseg0q6Ru8WlephthIr+bMnpuLinsOROV
	 QV4MBNkjH1713o/oUhl+byd7zuYiUCq/hxCnDVPiYKV84imKnLmDKnzFFu8bjPVccfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="YmMgZ/pO";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kh8NqtIS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F07606A327
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:37:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87F07606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YmMgZ/pO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kh8NqtIS
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1VQA2097597
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tWNqqUhi+1+BXB18Sy8VdaElJpWatihymQrBKDZIAhs=; b=YmMgZ/pOab9CSh5Q
	DVl3xNIexnnlIj/zQKs3hc/pzrbtXHmPn7TGlsdPgxAUpy9/ZzqKZ4LNPwnkB7vL
	F8Zk/BehkVn/5JMt0fWGJoklG0bGOCfa/wc9JsNLt4Nh42vD5wux1HniKAa65pDs
	kq33x6S4hv1O3wBgQgwH/3p98pu6plj+zdNMklwKniLieS21ov0TWTU+dwgrrFlc
	mN8/vqERjgEjMDnaGOPVx5XOuRn+6eOy0hkeN4PxrqQqcglQrxtCShhRBk2acWcG
	JSchMAdZmx9UuP6JVLmhR8gvpE3AF0lnUXSvtw04e9ompKow6crfj0ayXXuwBHOx
	6gfowQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j756k9pm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:37:13 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b08aee6b3eso6946879a91.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 06:37:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795790232; cv=none;
        d=google.com; s=arc-20260327;
        b=FWpLRX81bqSkHMQjbm5k9EFwJl+KiS6AiUcBYv/gPjYyA8ssCgYwPsPmYpfX66bGM+
         Ap4lkL8AROAH4VP7VLFFyehenCvfiXL9WFcmC4zrG0DRA06gnmFTXfyfazvtAiIr0Cdq
         yXQ81oZ20iWpBFLlwhMQ91i9a3i+EA6k4vf8aTUlSljpO1llCRpN0v0xq3qAiUAGP0eS
         gR+M0qLc7d0iubuHCJnem/tu7Kbl4xyK+iw7ghKNIMECZNSpebejglX+p2v2r6OGOynR
         zrYhLXe0RV72N2yfacduM2U3zPUKPJnHZHhSy4S+y5mNuxTn578eTspySt1CZEJKFU9F
         JvkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tWNqqUhi+1+BXB18Sy8VdaElJpWatihymQrBKDZIAhs=;
        fh=EtFvABw+xX4QpTlh/pm31XlZ8/tKSNJcINOlG8d1P8s=;
        b=LWsZDJIF2lj3JxWzCvQo79IS557MZUX51cxbewcWSR1Z3cZJekxxQzywoSgoeaxHq3
         sZeI3Fo+rw8v51eExjnUU+k+V0BJSiJzCuv5F0MM6BQCP2+T/KqQZAmno8R8F3cyRdU8
         NzFmx+JZC43nsOHtjD5uy/zy+QoCinns3293IzGRgrcLUupLws9lay76kMyZFfpoPk2c
         eq78zy9GK5bJsz6SmAolvCb7DVyS9xxSjbpuwTtBexAuEZF0S/ZMUkz0c4gOzmUHCZfk
         KoqwP1hl4RPpOIlBVwjRLQiJSbyHXV+qI30gKe6BfI3W5lj3/cqbLIHvOiJT6ZDH1Ppw
         gDlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795790232; x=1796395032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tWNqqUhi+1+BXB18Sy8VdaElJpWatihymQrBKDZIAhs=;
        b=Kh8NqtISoZ/Vkw2OYJepH8g7VFszxxaC8+OnoQ4WraEetnJ1DKypshW2OahcEE7Rsc
         wozXephNpe3etPMFc8Znd/FYmSP1SrrfDXw4dDq8WnIvILj4/6GwWU6yvzIeoHZIB9Vd
         v6NwR5AaXVwPgZ+bX4JbzuLmH5zA+vKl/6YCQsxVqzv1b/p9a0ex6b7l3/o6EGJ9NU+j
         ohe/EJWixmDTuXPcL0RKN/OGmoO3Yfk6oRp9nkH3ydnAm0XrT6JWbPzxRJb7lXI4uXy6
         bfkXHDYbAnSuXfC0HN0nzZaqMFFQEno7fVECEMFsa8sceA0YV5ImJmfNMBxm2Ms6OqHV
         3xTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795790232; x=1796395032;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tWNqqUhi+1+BXB18Sy8VdaElJpWatihymQrBKDZIAhs=;
        b=A4Crys8GQb7I8XDWNSNiWWm/IQpb4c67DnVVSODrUdJer7LcfJe8Z0YEUGjWy68S+1
         3hEPICTw6exNLPTo3CpAuaLUcoPb2tuSkPu110okcKlRqdTYP06AAzKl9QPb2u/ZaZB1
         /511Ri8merCVLmoTxZ7ommlxwFM0/G6HM1F+cxdFSSxRT73W88vHy5R3wCiWSkKBST/i
         AF8fjkMo++ibJyCADWFGSfVM72YN4Muzf84a/8aBrTEekfWXp6v5awhn/QqbIihdwmx4
         4JTLPVaZT925+ABkFb2WUQwwM6l9zzINUNo+gFz6+IvRCxZ4KR2aq89/BxtosA+P3FWb
         QDUQ==
X-Forwarded-Encrypted: i=1; AL+hErHP8q59m9V9bwTK5Od7PDBQj6Ct+uQB4zOv6ZTY1M5veyv13cioqZu9xO5QfeMX+OtwpfMzr2cEe3YS@vger.kernel.org
X-Gm-Message-State: APuU4Z99OGQuXOmfxuw/kWKqjpqwRa2rlvi3KLLOukj+KXZmLfrr4t4g
	eX2LptLLczarlW0GZEHRCo09sdx+b4qKcq3xbs2nLVXw1PAD1y/GOzv4GQvJXk9QpMcI54uKcx3
	Pcj7mvihH0eV4NU+pmXxuA2vKNRwzfDygrqSGb6NhqnPcSLtcz/IkKqS4lgc92GTwdo7cBLY1hi
	UKMB+9g3MTQoWLzCH2AutxfYSQ2PWLdXllMtSMJBU=
X-Gm-Gg: AZFdTZdli+4wYMfvVS2+HiI36tQOF6qrhBkH00E4CeHnX4/9RyBM8R6qB4hJCb58Jwv
	9RFuxbaKTlwUAMhJ+grGG83fjrt1vUrRir+jM752Zn8dLlB0mbGo2Iy+3iKHlcTWDpvPcE6GHCP
	OxIC83eaa+uMA5Vy0DWmP6HjVm7Lw7NC8h+zLD98o0Yadjg/z4oSmA6//76g==
X-Received: by 2002:a17:90b:4a48:b0:3b3:af45:6a6b with SMTP id 98e67ed59e1d1-3b41c7b5e76mr24825948a91.3.1795790232079;
        Fri, 27 Nov 2026 06:37:12 -0800 (PST)
X-Received: by 2002:a17:90b:4a48:b0:3b3:af45:6a6b with SMTP id
 98e67ed59e1d1-3b41c7b5e76mr24825891a91.3.1795790231581; Fri, 27 Nov 2026
 06:37:11 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125182053.3915833-1-kamal.dasu@broadcom.com> <20261125182053.3915833-7-kamal.dasu@broadcom.com>
In-Reply-To: <20261125182053.3915833-7-kamal.dasu@broadcom.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:37:00 +0100
X-Gm-Features: Aa3M54rA-JO2YKivrqSDVD5rGdTwrKCSYiQ6IpwpRh3i5IBbuLuwM2MCvKhsdJ0
Message-ID: <CAPx+jO8cJD74g=u1bHEbFVDe+KuxfspukP0VKmhgOC=dEr0Ppw@mail.gmail.com>
Subject: Re: [PATCH v14 6/6] mmc: core: Add support for resetting an eMMC at
 system resume
To: Kamal Dasu <kamal.dasu@broadcom.com>
Cc: linux-mmc@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Shawn Lin <shawn.lin@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1OCBTYWx0ZWRfXyMzKyM6VxkAR
 5bvvkPTWaTu6R92BLhDTOmjJzKlVrhc1je6W7XRQNv8yeEpplSGEaq6+Iwupo/ajhm46uKlifAV
 U/hEmLih0TGSnAMqGCFnI8P1EzmN3J2VGc/tvFXEffd5w08BE4bxCuyXmHs21lYBFI02CDkNPaK
 pCHcSUH8QtcdKVKNli/2HN/nXs+ihPaO67M7wUXgovQl013QCXeQpVjADqCLxd1HZKI/zXRdh43
 cAiNN+oo7aUfGuitjKSGtB4RYBqvEBxVftYNR0xIgmJrOAT3e+pAw3qnNvBEnFeQ9qMaNWs6HS3
 eA59wWMNOiopvi3h9WP16wrfEUj8vlgstnwRfWw6apFSr1sDpy7gS1B0RitCgbo5XtSYdl1arwF
 BHHVAcUuidOtJEfyvJfyyDOxNvEUzHGVqPH3ydPc7fWBBzoQ9hPfSENAStfAWSv5YSTI5m7TdM5
 deyXBwssdWvR7fWqsBA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1OCBTYWx0ZWRfX36h334U+Td/f
 V0VYliYJ0gY1YKi4fJBqa4JMVjygAoV7EX0Gpl/VoeNSMWQR6ugQJ3o4EgkevQtnC09dBYIUrLO
 xfZPWsUWRwUHh3P9pji7chiL9XHACOI=
X-Authority-Analysis: v=2.4 cv=ebWo7LEH c=1 sm=1 tr=0 ts=6b099599 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=Q-fNiiVtAAAA:8 a=EUspDBNiAAAA:8
 a=r6S0buWGwmKu9fT6DDkA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: RU-M1nyrZ6zzs2jdRXK36G0T6THx59Fp
X-Proofpoint-ORIG-GUID: RU-M1nyrZ6zzs2jdRXK36G0T6THx59Fp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270058

On Wed, Nov 25, 2026 at 7:21=E2=80=AFPM Kamal Dasu <kamal.dasu@broadcom.com=
> wrote:
>
> From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
>
> The DT property reset-card-at-resume specifies that we need to make a res=
et
> of an eMMC card at system resume, assuming it also has stayed powered on
> during system suspend.
>
> To implement support for this, let's start by parsing for the new DT
> property and set the new bit MMC_CAP2_RESET_AT_RESUME if it's found. Base=
d
> on the property, we must also set MMC_PM_KEEP_POWER in the pm_flags for t=
he
> host, to keep the eMMC powered on during system suspend.
>
> Finally, to manage the actual reset during system resume, let's extend
> mmc_resume() to support the needed behaviour.
>
> The property only makes sense together with keep-power-in-suspend, as the
> card would otherwise be powered off and system suspend is refused. Valida=
te
> that in mmc_validate_host_caps(), to make the host probe fail upfront on
> such a misconfiguration.
>
> While at it, claim the host around the reset in mmc_resume(), as it sends
> commands to the card, and propagate any error from the reset so that a
> failure to re-initialize the card is reported by the resume path.
>
> Also clear MMC_PM_KEEP_POWER in mmc_host_class_complete(), as mmc_resume(=
)
> isn't invoked if system suspend is aborted after mmc_host_class_prepare()
> has set the flag.
>
> Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> Co-developed-by: Kamal Dasu <kamal.dasu@broadcom.com>
> Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
> ---
>  drivers/mmc/core/host.c  | 26 ++++++++++++++++++++++++++
>  drivers/mmc/core/mmc.c   | 12 +++++++++++-
>  include/linux/mmc/host.h |  1 +
>  3 files changed, 38 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> index 8e9e61839198..9cb456a153ae 100644
> --- a/drivers/mmc/core/host.c
> +++ b/drivers/mmc/core/host.c
> @@ -48,6 +48,14 @@ static int mmc_host_class_prepare(struct device *dev)
>         if (host->bus_ops->pre_suspend)
>                 return host->bus_ops->pre_suspend(host);
>
> +       /*
> +        * If it's required to make a reset of the card at system resume,=
 this
> +        * indirectly also means that we must keep the card powered on du=
ring
> +        * system suspend.
> +        */
> +       if (host->caps2 & MMC_CAP2_RESET_AT_RESUME)
> +               return mmc_set_host_pm_flags(host, MMC_PM_KEEP_POWER);
> +
>         return 0;
>  }
>
> @@ -55,6 +63,15 @@ static void mmc_host_class_complete(struct device *dev=
)
>  {
>         struct mmc_host *host =3D cls_dev_to_mmc_host(dev);
>
> +       /*
> +        * MMC_PM_KEEP_POWER is set in ->prepare() and normally cleared b=
y the
> +        * bus ->resume() callback. If system suspend is aborted after
> +        * ->prepare(), ->resume() isn't invoked, so clear the flag here =
to not
> +        * leave it set at runtime.
> +        */
> +       if (host->caps2 & MMC_CAP2_RESET_AT_RESUME)
> +               host->pm_flags &=3D ~MMC_PM_KEEP_POWER;
> +

I think it will just simplify this a bit, but there is no need for you
to send a new version. I will update when applying.

[...]

Kind regards
Uffe
