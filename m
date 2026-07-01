Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17BC3A48C2
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 08:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782894235; cv=none; b=D5KuO83YSUDjbokKiKM0fx8HAPVV+iH9UFO6ZAAutt1u3XGqYXQEtYG/sMSdlC/LQHf3CDfh034V/1I9Dr6KAMwpf+8Aw6NaVe4UF5x2UKJdAe5vIdaHjYPFmuW0+k/V2K3ZOR7+fBSQnn+mG/hse0HSzJz81H1BGRgBHCfYvP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782894235; c=relaxed/simple;
	bh=xFiQKu3tppK+/p+0A+SIz1TOwpgjocYnBLAllGtYupM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBowsLWphVIs5sd7holidRLDIiOjXuRSXajw7QgLqeY5nhzIA1V+ELv2okAX0a4Cs4QB2kCT+vle5+ZT8WUShoznyRkfanUOs9NcnRRbtB3gDIpw7TZQ7AYkL4EKJYDlF5J5SHVx+ay9s6cGHgJRynyhWbmUDu8g8s+olHxIe6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OxQuoLhW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GOEWBgQr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OxQuoLhW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GOEWBgQr"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618GMi4488818
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 08:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xDr1P/gRifULM5ny/bfMaAFY
	vuYW12TgrrrVaHWwgQs=; b=OxQuoLhW5C3aI8eX5BvkQPrUAF0RCOuanrUCjLmM
	varYVfA51U58OCMJpHiOTWT23CAlXo/IR0a9MnCSF71t9Jcw64yvVHzHO5zPpQ7P
	CKv/lzsS25Cnou9A4MMpOEu0M7skaoaLh0Zr+qJhisxMkszXj3xiCdJmMbp1Mjpf
	4BeaudNS1eoc622XUeyOTn27jCuny9KhKFgIR2iGZ8SgwDER1vQT9bxApv8LzEti
	lqR908xGgYA7AY/BLjfLxAVkRbonZj7QZqoy0xgK7XhwyatpfUzeHwxeauKBY/ox
	nXbCNyjmmRHS07vrLIwnlGt3Kbxx+r/+uIaJex7km584HA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4rsy1myn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 08:23:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c6bbd0afffso9684425ad.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 01:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782894227; x=1783499027; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xDr1P/gRifULM5ny/bfMaAFYvuYW12TgrrrVaHWwgQs=;
        b=GOEWBgQr4+rUbWpb7zJ4c6ch/C9UOcT0T2UWdT0kgybg7QldwFaHdaJ30zQYLMb8L1
         Mt5AoDhQwG1I+ktExn4ttWirUtgm1Ua4iNMId7UgahBfejKTA5lbzlt1/CobaI6N23xV
         aOWmKX4vdFEzG70PnTwPxPCHm3NfUsaD0B2Nws/k+bxTHx/JLrIcUmby3gRiifdjgqVE
         vr9k2CV7tZEmhaNCEoij0uosk+fj//LBOw6qsl2l1FuV45Yn8VLr18RIgnN/zjFxwssx
         M/WrYrN/9yQQaJ+Kemqei/T8ZID9IBvZi5jvDxUjpiDGNLG+67r4E4zepDiaM0GL/AVd
         xFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782894227; x=1783499027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xDr1P/gRifULM5ny/bfMaAFYvuYW12TgrrrVaHWwgQs=;
        b=HYmarCdMEK223RCtSDrU1NBJLk/zl53QldFjsmUzpNTr1qgUE8FIKHejrDdao71RUU
         5CnFJRLUR5HQGBQ5M+qz9oX+OSVX1pj6lbZgkTgdea7NVLKl+/zx3FTzGmNeiJK++54y
         2swqL9bUa3zXG6WRxA57Cc1nwBH6SP4IrDOlm5AYSjOMa2zBPq9wmG1oibrtDxmax/aD
         VGIkUvp6py3CDgk0ghf3h4W5CfP2lxT26WQw5B5W4eV8dSnHzPD89HbrOpolSMEGsIL4
         JF9AcqufbpgitPpBQWvDS/q8fMsgk37KIbvHzGrfMgfEPYHN5F2JN382lldm04fPKPcH
         C4OQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro4ywKe4ziHDBdO3S3gyBLMhSzRIGRIy2gaUnL9om2N8GG37O9EYqT5kstQCskI7tqdQUIC5KGOwEct@vger.kernel.org
X-Gm-Message-State: AOJu0YzPVnySCKBzot2B4+35C/e8VhdwQnOUX0BUtc4fv3KPzTpLDUWd
	JKuLfjYdJg0PnulXuqF7P/PDT7QUFQNIqRfbdPfA1Jm8OkASYRo2mPLjZag5giO1KG/3Y3cuDcV
	tTKKEgD+dQWUycpAxkXRJX+KRudOBgcg03phJdiVh51rD0zVHE8J9gUFYjt9unw4o
X-Gm-Gg: AfdE7cmN87iHq8j7hrKU5PxApinKIaMfcaBb7h2sf20RI7F3rZlTQSn0YfgnyoIXoba
	svE8cSDCV9kwMBeclFStgXUXf4w6BW6n4p8YdCnn72po4HVCFAoOise93WMzaxvGW/47OzH5vdV
	DQwc8FSq9LbJiWzM/xLNZmOiFhxM5Z30lwrAoaGu4n43oMyNt4eKlEnMYFJqrtYZnag62auRVle
	b5RBpa6wstiIdPwwrG0DpYPF6vGB6MKUh9RBSwjiIlJ7HM/d5zJsmMMur2RldvTkCoUHwaZVyq3
	7UGjbrn2c2mW26I2coy6wtZz+QGSMcoLNsrQRRpjknmGb9lEGjci2/dlqFxH6GAVHXFy+njvOdZ
	MgSFM5LPBL1dRrSIlSlT/UCThrd+9y6Jw/MGl3CEXZ2vwvw==
X-Received: by 2002:a17:903:26c7:b0:2c9:c575:7e22 with SMTP id d9443c01a7336-2ca7e67b281mr9058675ad.9.1782894227400;
        Wed, 01 Jul 2026 01:23:47 -0700 (PDT)
X-Received: by 2002:a17:903:26c7:b0:2c9:c575:7e22 with SMTP id d9443c01a7336-2ca7e67b281mr9058255ad.9.1782894226918;
        Wed, 01 Jul 2026 01:23:46 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a7102esm28026635ad.6.2026.07.01.01.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 01:23:46 -0700 (PDT)
Date: Wed, 1 Jul 2026 13:53:40 +0530
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>
Subject: Re: [PATCH V2 1/3] arm64: dts: qcom: monaco: Move eMMC CQE support
 from SoC to board DT
Message-ID: <akTOjCDcQVLHOUxB@hu-mchunara-hyd.qualcomm.com>
References: <20260616130347.3096034-1-monish.chunara@oss.qualcomm.com>
 <20260616130347.3096034-2-monish.chunara@oss.qualcomm.com>
 <e6aa773c-daa2-43d4-ac56-4a26c58a3910@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6aa773c-daa2-43d4-ac56-4a26c58a3910@oss.qualcomm.com>
X-Proofpoint-GUID: xLTW1_gTf-Fgmai26OVI18vt4nHsi1Dj
X-Authority-Analysis: v=2.4 cv=fLgJG5ae c=1 sm=1 tr=0 ts=6a44ce94 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RFCqL2F_Yns_8Q2u2p4A:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA4NSBTYWx0ZWRfXy31kfmGvMb7a
 vod21JbLJ8g31nOQ2CI+BTvZoJXoIuklQjD9i6cLJIxhuBa4YbEGCTTVjGwMU41xlYg++btnkKt
 rBPETNtXqXT/zQrYVRdgvHoLP3mD0w9JcLIuneCBECHQGJoN+rTyKhTnEKZMpSXN62KZmyjpapn
 805eDV8NURRoTEqZ4gCm5h4QKMHuv7QfOBHFw3yiOgAtIiMfVebiKrK6gvLVs0rlvGUjYe1bhiG
 4HXFGh8r5ou5hCsIblWXcp9toafhJwSjh5vxY3ZHoR2FoWxqU4/N9QeVazvD8juUBrnJdOldeo1
 VCOMkzrMyC30TgnCWnPkia6+jLnGZtDq1SS8B+EEsLsiSWjndwkaaXjKaRovnRvGFlRt7rzlRYe
 /Hh6sp/Dlmd6Dn3vMhN8nq62z6x9GgxfMZxDPJnH7QEsqrhf/8E5nqvj+Ms7yinOLrtBV3p25gH
 EvqM/EWgrcA7Vbd+5lA==
X-Proofpoint-ORIG-GUID: xLTW1_gTf-Fgmai26OVI18vt4nHsi1Dj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA4NSBTYWx0ZWRfXyDAJVQmd3GBE
 pCkirNBGx8OmWILyxPMK0GpqJVLgNm07jFsm1twmvO53npxwiXJgNN0CRlYOJMAocMwK11O+L1T
 cTNOzffyfzRSjNomfcRaORSBV/KBowg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010085

On Wed, Jun 17, 2026 at 12:17:28PM +0200, Konrad Dybcio wrote:
> On 6/16/26 3:03 PM, Monish Chunara wrote:
> > The Monaco SoC SDHC controller supports both eMMC and SD cards. However,
> > the 'supports-cqe' property (Command Queue Engine) is specific to eMMC
> > and conflicts with SD card operation.
> > 
> > Remove 'supports-cqe' from the SoC device tree to ensure compatibility
> > with SD cards. Simultaneously, add the property explicitly to the
> > qcs8300-ride board device tree, as this board uses the controller in
> > eMMC mode.
> > 
> > This ensures the SoC definition remains generic while enabling features
> > correctly at the board level.
> > 
> > Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/monaco.dtsi      | 1 -
> >  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 1 +
> 
> Please also fix up monaco-monza-som.dtsi
>

Sure, updated in v3: https://lore.kernel.org/all/20260701081715.2580329-1-monish.chunara@oss.qualcomm.com/

Regards,
Monish 
