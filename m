Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793018682;
	b=N7VJFFD3u4W2XiNu/MochkiDQXhTavc5EvmgzJ+Zc+cRFPS+02AlqNzUn0SKgXjYQXvq
	 lXCDgrYmtR6EcF/v73qc5lnvl+i05+zemPA7XsqG/V0d/g1sEItabALZCgaDMVVJwavA+
	 gbY14NXZ8caMKSCNUOD0UjGoEG0fnjp98XjSy5IsRXbPfLOSdG/qLJ+8aySrmeeEpp5IM
	 hl61poPPTS+2YDKACmT50NcVdZMZjMiiPfZE+OwgesiVjwIMYmEBFUkBouQHTWaqnTWpU
	 NhT2U1QHXUaIdJrUgnE3+wRBSASmyymFjCmPz967zVkmwDvlF+UYySR3yJE0rGW0cYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793018682;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=005Thyq9qrJBejm2la/InYlIeabB0AN+HhsspFti4SM=;
	b=FPan5Uoavxk4ulDhGVcK3wECKTcu+tvnL8bPekhMb4fz1Xr47bA3QpODE8gf+fS/55YP
	 9qFeAoWM7DE4TGfas6FY3i2f1uaqGkUVNNeFAx50tcMSCjYpRjruc2+pS/fNxw05uoWyM
	 9c4zTh9Lxw0DtgRV42TGue3/WNqk6/zyXSrq0Z6T5r8iRdUv6lu44F0yo2F/Cb048BTiT
	 GeVPidum9szdqwOuoVhFLTksiPCeRXPuQ3HKQAmDomQ6AvLHEjT+gATDuicgcwEMMDAUj
	 6U5Q2Tp6YhTVMkcbzSqXp4vHaV7V9MpwH4XJu0HZelXR/VSev+FVTVsP0RevkqAbFkw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="E6qRV9x/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NP85lmLh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469CD606A321
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 469CD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E6qRV9x/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NP85lmLh
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAswWK3033791
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	005Thyq9qrJBejm2la/InYlIeabB0AN+HhsspFti4SM=; b=E6qRV9x/eE2Fi0yy
	1OvFNuN0nUHooQFKkiHdYWd1HhCrRBTAdNZlnrcnnzwFMSO0mnuQpIC/FLlbBcgS
	ZiQ8JcY9IXyFjEqNFO7uiP8e4/q+561D8FWB2C6xSPifbDVrhTfe1uk4zm5v+9Ea
	Q17yIQMoSgcfpPjEJlzL5Xr8JMkoz/0rir0KE6NdAuVXdFuvcAiuy07D6UpsFxqE
	AYjneMm382JNDfQuIkRx8vJNB355Tu8EkmBe/Oc1WzR39DGb5yRL+BuED416RUek
	/ouIuEOLFWiwHXLS0Ko1gOyp34m2aItPD5JU35mlVIu4SZBNAZGVo401vknqCtm/
	a/xagQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj56y0f6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:44:41 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eadfb67611so481558e0c.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 05:44:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793018680; cv=none;
        d=google.com; s=arc-20260327;
        b=h7VA2sWyCnOoHsa0ky+AwX6iDXs9Co7uzRiTr44cKi6FiicsM9npBPRzFE/YoyVRjk
         82Kb50zTHvbWpDP3c+EnUlrpg3k/hN99AfrBOLD5AEdQ5GvcrlB/2UwvqNOKGcFof63x
         SHLP8TjLtyYhiiuyE3axmm2ctULbjW/pDdve2tKD+I1zKAvKNzktpSFyvCN2WhtPP1lC
         0ejmskqp/uCmPMeSI9CjKNbUWLBQ7YPqbw6bp8CoxINTiC+NoSKLX8wuctt6XjMcTLi/
         ZsJo60kpOZ97uSM1bxjK1HGJZZhH303Kr9s/LHb/5fYUlN7mi8757xzRltw3oMJkOU7P
         q/2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=005Thyq9qrJBejm2la/InYlIeabB0AN+HhsspFti4SM=;
        fh=zRJJH6nDx6bRTaRNj0gqwFnlUNL2+gkr+9D1EFBzO8Y=;
        b=ZiZQ1uCX0DJ6/Rod3sgGGk2HnQ1/rgOcdVP+JcTPUBd8MrAD45JaatfkcHpT/7osYF
         VDOJy/vXA6IimeCtMH9AvHwv48/al3dMo4yRap117bZ/pXa+G5fxerdmzZZzHHx9+Pvo
         8zu9xvDRemJGzLAX6jH2onmx68RAweZc9jPMREfpvwY+MfYVEW3yOGzuBbSo7+bjBY5O
         UrIvOpGNhBDwPq8nGgQYtKUNPPClyq99AI9xYnS4G8GmlJ2nc2UECX1CdqIcc30uIfMM
         qkEhfpmzrJzfp8YYqoYzBwN7SqxtRdAbjmPBIgH7K/EN/CB6zRriqEuw+otrgcMYc3Uj
         Hszg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793018680; x=1793623480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=005Thyq9qrJBejm2la/InYlIeabB0AN+HhsspFti4SM=;
        b=NP85lmLhzodp3skdsw4qqH7atrNatpbJ94hZ2Wgw4OWFykzsv5hfHpuyabNNt0U6Ln
         H1w5xbZyxr9oq10Okv68X32AIRDnWYETW1b9JudVoSMjKWZgiZqM844RdlPo3fZJ/IL4
         jOm8kLcqaQU5wAWEjZNWhfnuUhm2qM7htVtbaX5E9VnagQqwZzkgvSIvT0M46kI1+PM4
         vbwZQm0WNmw5Y2oHbfOTKKj+MXNxiCSbxumNyal5gnqM8AjA7p5uFe5Vl2jWwIqZYnZW
         68X/xLabakWLP/Ocs4ZX7t3TgSguREeeQWo1CUvu9o7qOGDtg0ibndYa0B7NwSi+Av8a
         Kb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793018680; x=1793623480;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=005Thyq9qrJBejm2la/InYlIeabB0AN+HhsspFti4SM=;
        b=wk4kmPZrNgCr1L1JmF52oy5JUnChCcAX56Qf/9vb3ahmOhLcFTSmIsm1nSbwL5FfQU
         nvz41YgGUuYohLC/fLXiafZ99I2oJmLuPmPPiis0C/e2Y7j+FpevBC9nqBfjanKmZFap
         hmcB/2qp1N9RzlWBZ7oSs7wAocbz/jIScv5Uvuo9BDWE/ctkH+RCizxE1dyLs2ZpHRIr
         uB3aBieIeEKj/O1vuSQghclYN/kXAnklvGw8d5Ihx47fQDssIzVR4FCI5wijSiFiYL9b
         TTDsteU1ltV+e0UjJseqLt7DVxrR8ZpASlUoZzJsF+4SUazDiQkGxqwBp6AqD8HWXg6h
         vP1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzfglWRJh5VyH6tc2g1OH6Wp8kZimUeTXcZrwDC+ZXGErxWPGFEC2DuV09h6Xx+oNw9V2UwBiZ8HqXg@vger.kernel.org
X-Gm-Message-State: AFq9FYIoNQW8OafKI9+t9bly6AwHYS3AbrHcUR6dVJlnpAUTeKA5UaGg
	n3f13k0v3zxbSUzTpWjIqF3FHfrfO9bjinRj6hgj/yrGmTVqkFWchnq9V9MHbNTvhfnsL8cq93p
	lg4E+QcEGAi5P1KfWP9h49FF7ZGu3WuMsoUsZC6Jl9l42SXJ115HGZsOQnPj5oAnZDKjw+keie9
	Qg18S3ScNqO4NwSRecFnQsuoDj2AjVBxqgb01gzJw=
X-Gm-Gg: AYBFou06xQRXRb42XfPjM9+Ux8Bn/EFA6JKzxw2hSAFFumTeFeBUgUEvpuXANz6MR/J
	hkwY+uVM8C8VGj97tC05kqSmjb8yJ+8SFPi5lBBqGzfU/facZFFseoe5KSRXDdEAehOjeSj8MrC
	uOEATkN0xJnwLY9oDuYL82XphlHhB+sdtwSghTbyi/5H9J7yIkd8ipyX2iwxBo2uHo3jUkj6MjU
	HWwsKxNbtHedJyAlg==
X-Received: by 2002:a05:6122:78c:b0:5ea:9218:eac1 with SMTP id 71dfb90a1353d-5ec232ff8abmr2050010e0c.20.1793018680364;
        Mon, 26 Oct 2026 05:44:40 -0700 (PDT)
X-Received: by 2002:a05:6122:78c:b0:5ea:9218:eac1 with SMTP id
 71dfb90a1353d-5ec232ff8abmr2049976e0c.20.1793018679853; Mon, 26 Oct 2026
 05:44:39 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
 <20261024-kaanapali-camss-v22-8-7da3ea49c8a1@oss.qualcomm.com> <CAFEp6-3kJA+yct3GbWzs+NG=xFv_OGZj6OgToOnfcPkb9H=BuA@mail.gmail.com>
In-Reply-To: <CAFEp6-3kJA+yct3GbWzs+NG=xFv_OGZj6OgToOnfcPkb9H=BuA@mail.gmail.com>
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 20:44:28 +0800
X-Gm-Features: AclHuK_vZzSvUBbKv5qcRkDMeSvQ89XyxhHhnpT2JBNskNEMoXl_hPb8JdddQ0U
Message-ID: <CACbMrhoE2fcqGL-CSYPzacftuT=x+pVWAkkVvBXnkHuN+HzcBA@mail.gmail.com>
Subject: Re: [PATCH v22 08/14] media: qcom: camss: csid: Add support for CSID 1080
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MCBTYWx0ZWRfX8Yi2HPjrUrwS
 8fgyBa17L1sjNiLUBR+cJOpu5TOK+Sox/HBuqQo1Y4jkoocUGmc6AmCI/6ZfBuOKJGt7bfw4sig
 ZSnUQ0N5R9AwMDA+4Afm21R8yYo59ug=
X-Authority-Analysis: v=2.4 cv=eMeGH3p1 c=1 sm=1 tr=0 ts=6adf4b39 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yJPWxEu-MHjwpVTia4UA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MCBTYWx0ZWRfX4ahDs+5pyT33
 /IRv6HnzcyMEQTgMwSz6hIW8o5KpWWCfUrA5e/5QSAEn69SHV+Uw/dQzmNyfdDjToIgtwhNGS6Z
 xSmuV5VpnacPQVffHN9jaZGbek4JkVdThFQt/HnzVs+y5SrcfgwRILZzXBt8VaLkz388WRanTLi
 NtpV9RMCxEFb5UJbpy6iOVKUItuYrSku67f1O9nD2KgYKSWYwwUbURLOPT5l4zPQvk6J7K+lhjT
 rVtKuxtfrvfsXvW4/ows1f7ub/r5M7Y5HnoswZS50reWtDmao+1Kc1iBR/YLqcJWgStmQA6T6SG
 BE2NuBTaq26uIVZ1n3CSNJH3h1xXDXMsD8AG7WiP/98Rc5gCyl8PwAm4cwtD2jrtqpVooR70x2U
 M4z8kA5DjZc2bIWDhFHnMABMl8XiMqvavWGiTkwL4ag4X6B/UC6B2G+50cSPf+js5ddFpo/CbWw
 ZdXUr2xa8d8gqRdNjoQ==
X-Proofpoint-GUID: aeWO7LfCb0HcAJWSnAMUZSWJaxymGj7u
X-Proofpoint-ORIG-GUID: aeWO7LfCb0HcAJWSnAMUZSWJaxymGj7u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260050

On 10/26/2026 6:49 PM, Loic Poulain wrote:
> On Sun, Oct 25, 2026 at 4:17=E2=80=AFAM Hangxiang Ma
> <hangxiang.ma@oss.qualcomm.com> wrote:
>>
>> Add support for the CSID 1080 hardware found on the Kaanapali SoC.
>>
[...]>> +static void csid_configure_stream(struct csid_device *csid, u8
enable)
>> +{
>> +       u8 i, k;
>> +
>> +       __csid_configure_rx(csid, &csid->phy);
>> +
>> +       for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS_1080; i++) {
>> +               if (csid->phy.en_vc & BIT(i)) {
>> +                       __csid_configure_rdi_stream(csid, enable, i, 0);
>> +                       __csid_configure_rx_vc(csid, 0);
>> +
>> +                       for (k =3D 0; k < CAMSS_INIT_BUF_COUNT; k++)
>> +                               __csid_addr_update(csid, i);
>
> Do we really need to trigger the same AUP several times (one per
> buffer in the FIFO)? could we have a small comment on why?
> Isn't this already done from the vfe_enable_output helper?
>
Yes, this is required. In v2 we hit an AUP-related issue where one
buffer was missed and capture got stuck on the last frame of the stream.
Vijay explained the details in this thread:

<https://lore.kernel.org/all/662a21a3-de8b-406f-a15d-b8a572aa79ab@oss.qualc=
omm.com/>

In short, since the split design was introduced on the 980 platform, the
CSID has to be configured after the VFE. Otherwise, rup_done or buf_done
IRQs can be missed. Also, each buffer queued in the FIFO needs its own
AUP. If only one AUP is triggered, the last buffer is never processed,
and the pipeline stalls waiting for a buf_done that never arrives.

That is the underlying story of the 04/14 patch and explains why it is
introduced to handle the platform hardware differences. Thanks.

<https://lore.kernel.org/all/20261024-kaanapali-camss-v22-4-7da3ea49c8a1@os=
s.qualcomm.com/>

[...]
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/me=
dia/platform/qcom/camss/camss-csid.h
>> index 2f7e593defed..603621c16315 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid.h
>> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
>> @@ -162,7 +162,13 @@ struct csid_device {
>>          void __iomem *base;
>>          u32 irq;
>>          char irq_name[30];
>> -       u32 reg_update;
>> +       union {
>> +               u32 reg_update;
>> +               struct {
>> +                       u32 rup_update;
>> +                       u32 aup_update;
>
> I would say keep it simple and just add addr_update field after reg_updat=
e.
>
>
Ack. Thanks.

---
Best Regards,
Hangxiang
