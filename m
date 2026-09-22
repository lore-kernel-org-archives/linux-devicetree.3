Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB45F544D44
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 12:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790079650; cv=pass; b=t4+/cu774e7KQMOjoKuFL5XIcSynNraI/h7CQd1hf+iXJynCQ1ng7ASAXUGHtl40uCnvgplBfkxFyU0du7yxUUlHF8eRUJWCDnpFQUZ9xSU9tl2oCVDMAnq0v3UEy2DzvC+42dfJNxYrjDKJgATZcJe4unZpOAzWtoPVk19RM8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790079650; c=relaxed/simple;
	bh=MSdsTB8asp6sbX+GEc7UhobdmE9wd/t8j57szPiLqh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ik2jXB/FZmgoVPWcfVkisBKWrOGXMHaT8x/Cm2QD7/p5ETlCVdN6ZvdHdnicaVdnbuUq9Bx04eGRi5w48j2kHhAmhnJxUx0JrokV8GJRTqwU5t00nPZecIdwl6deIkcraTrfBDFXu8/8ni3nVeQDajPlpnNvlEG/WBP07qhixF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y8pVw0Hy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JVnWbDFi; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y8pVw0Hy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JVnWbDFi"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPegQ3487652
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 12:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+05yLhpdjxIjVjNj5alAxW0Kp4QLw+qzcHO01XuOZE4=; b=Y8pVw0HyVHJ7coKM
	k3sofOBeQp8+A1tWooBMhmH6659wA72pxymQfJNeHY4P6/Pzn4Bg4JEL0P/1AGCk
	xZMHnhHBhci/6OggyqWoQnnVa0PH7qgKP3/Ln2VhSgjQv63mNOhoV6qeNerbOh9Z
	yqHd5foamo6LwbwkrcA80SxABzi31nLF91XWV+EFpMW6x15jsQj6rNy361pT9oAu
	6MIayiHAZDU/BKA4LDDjXHzsidYTIw+ZEWRNTSBG/h4I/hQHXkCYNI3X0jHuqOV5
	Uwz+t87gBXgPMBDV8tNOoF6TlY8fz3MavwroOVv70rVR1W3hm3q1fo42pYcx7vu3
	U/iRww==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gudw0jsf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 12:20:47 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so5503378a12.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 05:20:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790079647; cv=none;
        d=google.com; s=arc-20260327;
        b=ehpl238yld/sjH+11uU3liVMSpHqUskWCLSpKfzgXyBGwcGFDVv4giTjupH+4oYElX
         lfTgoeDINCxwPXJeax75ogceg7eYbagWttcg/dNqvGddUe7IKi5ME+LnIGeDxD5IKM2P
         f6op4e4+z3pkP0ZGc10LZiOlIFpfbQf7MYptUHHmu54FU00bKt6vSn+N96mHzFeJ98Xg
         L5rMDWk+xrBBaG7TVxgZMynjqI/OBrhfx5pw7Xr54R+VhNc3Geq+X/zEPesmYQHPZECs
         SryMCSiB2NJWrafvObcD+EqRHgb54vWQIbI/LFXnoqZDqSaujRLLLsctAh3g+eUVYg8A
         i9RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+05yLhpdjxIjVjNj5alAxW0Kp4QLw+qzcHO01XuOZE4=;
        fh=/KuTzsvxXzgMb0tQOfQI+AzI09xQ1I1e2F6NKfvKRV8=;
        b=R4QPxvIZNzxR/orpRoyuDUVWmoAYubjAIYAUXgWc0p7vjkXtRupD0tNJVoyvF24q3Z
         PB7uQqARTmet2V09JxYPU1CzuI0GSgfJEYhvXfb8Dy4pwkiYj1i2RE2VnX/N77yXrozY
         MeZNfTavPFc4I4tcB8QgmBmo7iXkjo1gokBVtLnTalvny4lw0pnCZW4RAP2wIESTRMGb
         0oDX4yIcWoUvanTWuIhD3maqucpSIqiTkozFb/5SpxdQKJBgARsgxzwjPxlweNZg5Tps
         J87KBtuGZAZVJgE0eBc3ShZ6QA2tcQTEzl+guQlMahiKNBHPTjvJrnJkk+yEot9MfYa3
         KJQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790079647; x=1790684447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+05yLhpdjxIjVjNj5alAxW0Kp4QLw+qzcHO01XuOZE4=;
        b=JVnWbDFiC8Sm4sXt14cHmFMJod3cF7+xJIkYEEzznWA9z+MMd1c1J+dO92fej1Cabj
         rqoAeZxvxTUs8//gGUSZm3G5Z6qZdr8xlhjmYe1WQNNA7bCPfJQoEKeavf5QI0bL+oZd
         DgC8XzTXxtacNwLC38JvJose6uMMN11Kp0R0biFw0d8F3eaiLUAfiBVWBaczPgBFkrwh
         6D0sUmUlQvxQilW+QvXFMqWv6KAiA+baGv7RIs240QlkUobVh2U7yJw6EsH1wuZV/c63
         77HiuMgJ0EYQhLl/YzoLc31PLrgN8sYUmrsUTYHmo2pMcEwzkbEVxqIFB59UdcVgQOgG
         BvPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790079647; x=1790684447;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+05yLhpdjxIjVjNj5alAxW0Kp4QLw+qzcHO01XuOZE4=;
        b=bn6MGRg++S6ujbpgf6OBcIue7uDqQBLc0FC/NfhRWXhhaG16TmnngZHIrRfYbx5khx
         CQKenvcTqMm/Mn4fWrV+zdCcvsHyGc13jx2UKYMaWX2i6gpL5t6kc/d2E030kzgFlU/L
         m+b1C6MXFfz8Pz4gsb6bxhR6rZBSrT5UNQzsM1ac//FGrn730+0ArFJAJW/zkBaa3/Kl
         GrzjCLJLWX+/it1SOjgq6pn6f0vXhzDnqDQYNYTr5E+ffxej/dRWt+IPfvYoj1DfVdxc
         yJN00uCVGQbF+VpZMayus98VK0ILo6erDqeR5nB5PfGDWryNpPTauIgfOcn6+f0aEu96
         RELg==
X-Forwarded-Encrypted: i=1; AKwUvBzPBSe2skeJEk5e52Ue/2QxhuRa0gFpe/IR1UHBHUJQ5MCV0p1mN3zRXpyLAVureM2SdK4uHOqgsDZt@vger.kernel.org
X-Gm-Message-State: AFuF++kVa3+6fsQfg1HEzy6Ijc0FogYC1vdivNqDag98XiyJUD5/mhho
	40MMBGb35UNMITUKLI7UIh8afqsg7nC6hraPSlHhujIyanA1Wo16cEPlAXQcV/2kjQtTgsWW6Jg
	7846a3rehnRGPz+vzFeynYQ8p6SItcDiZG81mUtsZ2bmokwjne3S3G+tZZwDrVQsoP8hlaDPAGp
	IvF1y+2YaGIYYXcO7bXOdZkeiw1LjUFtqswPRHAOM=
X-Gm-Gg: AYBFou2+gYGBZdfWFdI1mGljzmiOsHQaAGAOFoP6GPaGP+Xqk2pN1JLT5BCOf39Pqil
	va8j2kDYe4hl+7jiKsAQ5s17KyEc2u418Gp3V+sKYy6aJQjW2Za86aVmDBGhS+qlgqu2rIBmFhJ
	oPZEYvfFwS3XtHjupLF1amU0csTvf2u8kCl0Lo0M6lGUELkJbH4MODV3iJQw==
X-Received: by 2002:a05:6a21:8287:b0:3dd:ddbd:c5a1 with SMTP id adf61e73a8af0-3ddec1bb561mr1447626637.0.1790079646787;
        Tue, 22 Sep 2026 05:20:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:8287:b0:3dd:ddbd:c5a1 with SMTP id
 adf61e73a8af0-3ddec1bb561mr1447597637.0.1790079646271; Tue, 22 Sep 2026
 05:20:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831090134.585588-1-zhangfei.gao@oss.qualcomm.com>
 <CAFkd8hth1ds5j9jbe3vjjpCYkbTVSeTiVsQvzy30YCyFUH83ZQ@mail.gmail.com> <21aff47e-07cf-48b5-9752-b1a9dc7e6095@kernel.org>
In-Reply-To: <21aff47e-07cf-48b5-9752-b1a9dc7e6095@kernel.org>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 20:20:35 +0800
X-Gm-Features: AcwNN1WMrRCQu0nVlsJVMe76UpuBh2J8SD-x-wYYcin-maJATBqrUQkOk85mQYM
Message-ID: <CAFkd8hsmBeDzWn1OwCgM0bmCmAP_B5iD7=9JqwzYnziwOWB=pQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: interconnect: qcom-bwmon: add nord cpu-bwmon compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, shengchao.guo@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: xYxyDPvirLC7UJC_ufv-htft8rvQA9t5
X-Proofpoint-GUID: xYxyDPvirLC7UJC_ufv-htft8rvQA9t5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE3OSBTYWx0ZWRfX45myX2ydbVLs
 9AGSOP9G7XmJt3foIHrFIMUGjA51YvDdWmN+YXqaZA76v5CeHn0sUjTQxwX9DJ8vNkLRpgONKxU
 AZxDwOwwcQ5xGb8phryCjsyAGkEz3yRmJaCesXK1oFXcufdfUSMCug5VCpvsF6P23ARE02Q+EhW
 DvKF7Dr+VCYsLAkEBNQJO4IPHuRKe1mxqPOIVgVdhYDhy2ADyexghOrjBPR5XXGaNM33F9bZ6Cu
 ZJBNhz1Zgq4cTqWXJed7eR3FXMMQ+gz2ewrScPEF2NJl1GXNfK9eTdvLSCqExAHbCzzL1XFX5VU
 GM+R5KmwmJA4CVraiPhs9XNf8uqzriK/kC+HC8ocykuSEMSe9bCybYasv/it6e3xhhRULEbFj9d
 CN7r+LZ7hpjMDzVP+uNtkRqcZi6hON/7uBwCAPsBFEDnA5P3/bt2GOxi2c7F0JN2bSagDV/ryyN
 I+90XfbtRlHVKUZ5Vnw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE3OSBTYWx0ZWRfX9FcCWqFXCnWA
 Mumhw+fNVj0/6kpcaaVeWEKT3uD05qtI4LvVBAkuyPv2gCFzOU5zKhEr7/mTvtHUM39xk9suIy6
 BmBJviFggE1Vrl4d5x1q1E03+Q+996Y=
X-Authority-Analysis: v=2.4 cv=TvFzFzXh c=1 sm=1 tr=0 ts=6ab2729f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=D19gQVrFAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=tDlUhY5aTNnqvAx6hSIA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=W4TVW4IDbPiebHqcZpNg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220179

On Tue, Sep 22, 2026 at 7:38=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 22/09/2026 13:21, Zhangfei Gao wrote:
> > On Mon, Aug 31, 2026 at 5:01=E2=80=AFPM Zhangfei Gao <zhangfei.gao@oss.=
qualcomm.com>
> > wrote:
> >
> >> Document the qcom,nord-cpu-bwmon fallback compatible used by the
> >> CPU bandwidth monitors on Nord.
> >>
> >> Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
> >> ---
> >>
> >> This compatible will be consumed by the Nord bwmon device tree nodes,
> >> sent separately by Shawn Guo.
> >>
> >>  .../devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml     | 1 =
+
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git
> >> a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.ya=
ml
> >> b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.ya=
ml
> >> index 21b4e04727de..8c82103fb86b 100644
> >> ---
> >> a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.ya=
ml
> >> +++
> >> b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.ya=
ml
> >> @@ -30,6 +30,7 @@ properties:
> >>                - qcom,hawi-cpu-bwmon
> >>                - qcom,kaanapali-cpu-bwmon
> >>                - qcom,maili-cpu-bwmon
> >> +              - qcom,nord-cpu-bwmon
> >>                - qcom,qcm2290-cpu-bwmon
> >>                - qcom,qcs615-cpu-bwmon
> >>                - qcom,qcs8300-cpu-bwmon
> >>
> >
> > Hi,
> >
> > Gentle ping on this patch.
> >
> > Shawn has posted the corresponding Nord DTS change [1],
> > which depends on adding the qcom,nord-cpu-bwmon compatible in this patc=
h:
> >
>
> Based on acks here, this should go via qcom soc, so part of DTS patchset.
That's Great.

>
> > [1] https://lkml.org/lkml/2026/9/22/844
>
> Please avoid using lkml, but instead use lore.kernel.org.

Understand, next time will use this instead.
https://lore.kernel.org/linux-arm-msm/20260922080416.484280-1-shengchao.guo=
@oss.qualcomm.com/

Thanks
