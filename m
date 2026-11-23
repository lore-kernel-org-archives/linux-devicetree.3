Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795430494;
	b=gMojgUTQl7gmVzXSzXDrtTY1TMHMWgNWVOj+pBMplM9hBrVeW3C5IHQgRkK8Zb4fa7rH
	 i/P9H6KFlisfcd4lX18J+kjVvi9KykQxxoKaMBvTBqQFhz52mdsos+1K0QHpkzp8+0SdC
	 H3Z1hYu5siXzzs2bzEyYobeth7+Gjf0y1UPevLdjvhJrmF1Qsq9XeJT058MsRSO/5SqJl
	 6vZbUVAMe/kvOPIG+L06j5J4z18WedwbTbml/S1hghsDmLvdk8EcSdJRd5pVKwRDg/p2Z
	 QqOprrJdV74eM+laoJjF4LDDG6TFQ0AYBft3PSoLEj4Xn6TxZrqZZlAQkUR4gCaFR/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430494;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=27iEvKhRk31vKMnFYFf2M0/AFhO1yHWq2P+tmWU0YcM=;
	b=2qjy0M7dq2EFMus0XDmvQqYcH0Bf4LiAsm+DknO7ep3/JODDvFGDT3hAMRqzKwm3251V
	 KfLFIaNfEk8ZtncBUmNg2tVXBajSmp+XYGiqb9zTTSdnG1/f+rR68n9K6s2lqQWdMzbZk
	 gRrBgJ41apM/eM4WC43xqIOtuqeugj7lJnPmczBXTz69hzepD66vl3/cSAWFB4tpNZ8UY
	 Pehm7b+JXleXAUr5amM8DYbakDA116rXx5vEbj7FBrP9E0PbwkAKbTo4hw5WHykm/zzVK
	 1NetXYfMqsz9fwqJLMS/H9UaHz9RRgRATIMaisatYJgFR7Cw1AZXvL53jqGwjB3N89A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="MXL4C/Tw";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lv8chtU4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC39606A31F
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EC39606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MXL4C/Tw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lv8chtU4
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9Fnnh1828360
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:41:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	27iEvKhRk31vKMnFYFf2M0/AFhO1yHWq2P+tmWU0YcM=; b=MXL4C/Tw4mJRyCmS
	/3p5pVKnE9YSURx4VBWSffV7NPCsb1eQwGe5wCJGoutqbiPziJG2dOwZ1d1EOmiO
	Fj0e28GKZquYDNB+ixNgS7t5kWFZlT+dicAGFFGH2n26WY2254ET/dxV9tPKsjw8
	tAKJctyF1vXmlEPUOzL/FCv49Ed2MMWEdLQB8U2IripixkCAm0Nf5W4JU12hc0ZD
	eyapXyta1eZz8hQPu4SyeTbBOdVB1utNJVzULLylzLeNjMz5jezX7zVOeBH5X4Xb
	rQd8Ffzj0FFz+VSl3KikyDhJ/DEV5s/I9eNRHPC7HNHRKl0J3mLBHV1rI0DGWOVr
	iR3gNw==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1p8y6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:41:32 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b0e4c2f052so47558987b3.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 02:41:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795430492; cv=none;
        d=google.com; s=arc-20260327;
        b=ZEDAWW5fYLhiIAFsLqHAFfq9QW9Hn99QdU6LjfV4O0ory97Kk7aen44av4MKD7oiao
         7YhN9xa+/s67yHKWbxGccthBqxG5SdnCkYSYsDLz7Jow7tKTqNNLDZ453wnddxcRUZ0x
         0+XpWkBzxAvXJBpA6VSdglX3utbJRJmqWO5uV9UVcnr4ts8Gpd7PJkWGhXfpRZ6wYtWj
         6VHH5Ihk0O8rfAPlLBCnSNg+mlbHcF9/mSzfIRd+1kJ2HvajLBb9KheEToie0asxJkMn
         O3/mjD9A5U3F2gl8q2ejKKhO0arLJJs7CvewZmqloMHB8G8KLlb+sLynhdpxRYemxOXF
         CmZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=27iEvKhRk31vKMnFYFf2M0/AFhO1yHWq2P+tmWU0YcM=;
        fh=gdjCZKDYOUH0H+b3GTZ42BJgGAAbsKS9tiJT37Vocws=;
        b=qO0ji650wfnqqxChr94mFSNioEQNt5RAhYZoe4dUTaDd9a57SSKH24GOO2OrGTQu3G
         Y8bXIrXt/Z7Hbm3mOl3kusXe1PsF/0YT5wFVwZD55/nDQvzPfv3ZKdaVBlUIu1TW2UvG
         HuGfhMAcfyFgLrxCVaazbIwlTNhJptAPQa2VHorSjC4bv0gHxo6W0fCqFHFHyKW8ig51
         3rYTtDd0YphrzqVeLNEWpGJ76CJ1byatYzOiEIYUl2ubQhRWjuAvCIPmuPwUaeIlLeJL
         N73qoj9VVULp9cr7jyHs2o8dKAP6o1bTwfVVzrH7LbQa+IsZOK7YxrEIr1COtQs9g7dH
         qZvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795430492; x=1796035292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=27iEvKhRk31vKMnFYFf2M0/AFhO1yHWq2P+tmWU0YcM=;
        b=Lv8chtU4egopjHPByugmBHYt68mYV9sT6UnGb8LtCz2Z+tyBUhkJEZCyajUa9z+vne
         DMVUjc2yzgCDUkHb3HpQqMV1kAykX5Mx03SIHESvSfXWWmnyZY7EriripzhkcDTY3m67
         GwzCroB7DEwD2tn/nRKu2Z3y0Rk5JYelYDyp8fDlcZF2roe+9kO3UGVC0E8+oqXp7oWP
         gYMIQCMBpgoRoPKDGniCODt6DhOQpN/CjnMP/j4Mmg7raVXxMT+35Yebv7+ZVzGnv9cP
         OqT2i3Tm5mhs0VOPSSfvhhkVU5PuJhufr5rDqD/Vz15Up8Lq9RWLtRH47dXTAGrz3/h9
         WprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430492; x=1796035292;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=27iEvKhRk31vKMnFYFf2M0/AFhO1yHWq2P+tmWU0YcM=;
        b=TLqQVG8vnhZIlj1K8K6m1Mi69QuVfzLMOSTVsb1nTVuOLOVuVYX5k142VaEkitMasu
         AeFn19H5DiDZEUYZssbQNvrT4U4UwFmuOKWZI4vL4aEvtXJMsbHYVepwbYJKsYAfLTif
         9ujCOw+owJlO/7hF5IQujKrgeKaL0NnDjWiFZJCpEmJiVmfwfqpT2yUR4RwH3PIFm8gA
         lcfEMX6uU/Niyjqj7Qbuoin9xZIvHDTsRWw0HOOmGxMXbc6iDLND1UXFmYEijmoLRe3y
         +GiKnWKp1A4k9qyRPWDQuoB7Fue9g1d3N6DO0o3GE/bArLXBrtkUqRJ43hYq1OLhY8jR
         0VNA==
X-Forwarded-Encrypted: i=1; AL+hErF3MY/fJTd5LVTxy4g99nap9j95O9DGjtnyHUCam9mDSirzzbTSz0gyHNIAzT7PEggdG2UDv1BAFVFF@vger.kernel.org
X-Gm-Message-State: APuU4Z/PrpufplZRDLFqff/ob683bNCRKAMi9UVvTEXH8T7z8vau2q2D
	PMi5unDJDRqRZOSxl77KymTBUeWvrpxeJ5VnnBZDsv9A8xINHPndX2lFTXgvwaBTfea4WxmFs45
	W0V/nJssnlpIgTzXWtu0rasAnYk9djlHgMWWXYg5SXS62aK54p06wQX5f/rmlIZraRcOjQq7+PS
	l7toOU3LO37kyfB7y8oOVFFJA9GeDEqJBOzWtwvkM=
X-Gm-Gg: AZFdTZd/RAc+AFFAhoa2wTLXtM0YmXjUkK9c/Zd6yPjaShNmXqebF7UhvLX/QxattZO
	/L/pRv/MZ1SkVxQ/DvcSY2626P0joNMdyIibiZ9JF6JIF/eWaLSuwuWcRADuDcTyJQMIwF/atKs
	M1k1SXQcz1bqBDori4aqcz7D+7gNIbdSs3neGP7VU+PQ9liYaqTC55NXQ=
X-Received: by 2002:a05:690c:6104:b0:8b4:cd2a:b70a with SMTP id 00721157ae682-8b520518c27mr42200247b3.67.1795430491793;
        Mon, 23 Nov 2026 02:41:31 -0800 (PST)
X-Received: by 2002:a05:690c:6104:b0:8b4:cd2a:b70a with SMTP id
 00721157ae682-8b520518c27mr42200177b3.67.1795430491400; Mon, 23 Nov 2026
 02:41:31 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com>
 <20261114-qcm2290-eud-v1-1-b6157b817377@oss.qualcomm.com> <20261123-crayfish-of-splendid-courage-c63931@quoll>
In-Reply-To: <20261123-crayfish-of-splendid-courage-c63931@quoll>
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:41:20 +0100
X-Gm-Features: Aa3M54oHmRt3xfqR24IGlW8Kt6ZRAtG-3k_KFIjDV4TNG0tPhafKEYvoA79oUAU
Message-ID: <CAPzfCAary8rkKeF+XFRFShRiy6GZwh_ky9_mo33C8+gGSxRnMg@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: soc: qcom: eud: add the QCM2290 EUD
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX/zFbRxmx9cOP
 rHCdZjeA62AgMsmpw9nobZG1OlL1m/PYLQlcv9nJpPXWoc7I74UCNYoU61DbZx7FBDRGJ5bZJXN
 mG3HWyzEz23pjRMZGBxQQakKCONr6nAHU02NM3Dkjk43/FmzeRn25Y9A9ZN5LVCYNR6dGxSFN7d
 HedWvncwbcNqDxHFmN8vRIn1asyew9epwdEEB9L0tIcUjWYjE18Ne5t6Sgs3QYKuCVmj45PivPB
 WcCiPKeb5vD2wyoBTYWgH0DRNl9cBgsegJwn1q0FbGUcx8e90LZtd7wC8pacroAUc5b+ahjb0wr
 X4jeS298zDLOtRS8Q6HgZi4TAS8Bi+O27+6R9r19w+cGPsBjKm7gchd0FMzf1ikCJ249gKFfyRq
 2wtAt6gs+Qb/o66d6rGLVlH2d5bwuuwtFr0giLGGiuw3getn8xH+a5081hPZbn4OESX/cLl0pIx
 7U5b4BaXP70JdpZg2bQ==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b04185c cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=AX2TNvW1BK4AuF6XdYAA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: dSoCq9t4prYkcQWKHPQNaYScPvsb4xFP
X-Proofpoint-ORIG-GUID: dSoCq9t4prYkcQWKHPQNaYScPvsb4xFP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX6LcJBxLUIEnU
 R4Nlnu0ALQnmpFNwl7ftekT88YhZ5Xmhay6tDUjlVrQ4R2irmCjT1Xu5HGpSbledkEN7UdiR0SI
 2LISQfSpUUWQcItIHCtKK2DCSlADEGY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230042

Hi Krzysztof,


On Mon, Nov 23, 2026 at 11:22=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Sat, Nov 14, 2026 at 04:39:04PM +0100, Igor Opaniuk wrote:
> > The QCM2290 has the same Embedded USB Debugger as the SC7280: the EUD
> > CSRs and the mode manager register that the secure world writes on
> > behalf of the driver. On QCM2290 the mode manager additionally ignores
> > the enable unless the TCSR register TCSR_APSS_SPARE_REG1 is set first;
> > the boot firmware does the same before enabling the EUD, and the
> > register is written through the same secure IO service.
> >
> > Add the compatible and describe that register as a third reg entry,
> > required on QCM2290 and not allowed on the other EUDs.
> >
> > Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
> > ---
>
> Feedback from Sashiko looks reasonable and I do not see it being
> responded to. Dropping from DT Patchwork.

On Mon, Nov 23, 2026 at 11:22:21AM +0100, Krzysztof Kozlowski wrote:
> Feedback from Sashiko looks reasonable and I do not see it being
> responded to. Dropping from DT Patchwork.

Sorry for the silence. I just silently agreed with the feedback and
took it as is
without replying on the list, I was planning to send v2 with the
sashiko's warnings
addressed.

Is an explicit reply to sashiko's review comment expected as well, even whe=
n I
simply agree and address it in the next version? If so, I will do that
from now on.

Thanks,
Igor
>
> Best regards,
> Krzysztof
>
