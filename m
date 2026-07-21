Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AA139EF16
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784644196; cv=none; b=A3PCx5XbEP9J1XOcW+HOCTBJ5C3sHoO7xb4ZVJ6JhWB2ic0Jsu+galyKW5i+Jaxw7hf+muh6bnL23uuOFNeNwX5BpOEvuhiUNk/6XZUWb7+qmr1d2Io1Da5llh6pCukj07wypOPoKWt5FF6CK5QAxYyMwmuOzEthOs5xAXe9k2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784644196; c=relaxed/simple;
	bh=Qo6asdBsJFAV0Lv58WwH8JVlF5O6ZEi9Xu1l25YSNHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AcrNR21RUn9Rd0s3VoMEU4xSVp4TwM9rZyUkgJGTtlvXcNIbAdeViRCNEEcxIHaXRUgM6Awc5EoQkiabTZSfhHPwuB557MxUvo1ilDpGxRk9WTlhH9tAOF+iRYvZC73uA7lH+OHLCknBcG1eLej8n8UXDy2KPh0Gg/et1REjo/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H35NjfHO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LQkNLYIZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H35NjfHO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LQkNLYIZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg6At1958707
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:29:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UEeeYWBcq3yKMtCBpuULdCl4OrC79zsAccK99GHfkoA=; b=H35NjfHOWu48YFiR
	1DrnUwAsRLGTZl9PAJAZawf9ic//r8Yz6n5B9iCcUTvzxmtmdIxWafCMkHAdiBd7
	z8Sonusa3d8MXQP7MDa1zsATYsAA1jc4JygqyshXQkyAQXZ1XvQ5cGFDuMOxZGLa
	AoZx7oOnHxrowfYfkS6ZveOMkFjMlOel29yTPpOqrwC+pUHXTc3JRkk+vTuvrgHb
	JlJwbFvN3LgRiaSRoFhvfGEc/1yUdkbtSN2uDeqz7r92Z9MXqtZf+2dwb+5L9A+D
	mOWutJiPsMUN4gd/sa/psro2OJfbFW1QF2nD5t2Qb10Y8lYT4EoW0BxSo5tYVfYW
	Xto03g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1bvtwkh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:29:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e6415f279so163883385a.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784644193; x=1785248993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UEeeYWBcq3yKMtCBpuULdCl4OrC79zsAccK99GHfkoA=;
        b=LQkNLYIZsjlYITMIU2kgfuRhAvnRRP8d6frU17bia+PmBkJFK/ysVFitcoLnf056i+
         dhMZTtUnMqImHTx4HiLgh7xNMCB3a6ukaSwC5iZvtIU9GJ+Z0ONmF/lq47fCGHVdZtgr
         n68upyanSqc+9V0U041CifJNe1ID6UR+I9Fhk4I7ADRJ2g7xE4FfzpSK+AWzMCeLsPLg
         D+wk2EsNZwPKRYnPG09EVgQk5OjYxUkt0wHKLtHf80k8OabN6eZ+PbtvYdvAdHWTU/ij
         dyxSY7H58E7ONqoOSIFdIJ0AbO2XtkqIXY3aIX9SRBW7Jkk0nY2mjy1z0VjeUJdcZN/C
         Robw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784644193; x=1785248993;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UEeeYWBcq3yKMtCBpuULdCl4OrC79zsAccK99GHfkoA=;
        b=npoa164l380wIErkYi51BV1oGoOwTZGvt9jPNo6T6bRxeEr2LyIhyQVjJkrjxXX+CG
         uTTCPMV6nrktLM9KfoGXgXiDR2DDHIcOUed/PLWX43wK42OEs8sTP3woY/N0dbYc3WLH
         p+jYBno9P7K76AfPNee3/osIL51BHbrt835gXWAugzQ/o4i3o0BxiAd0mEg9eq5yUG+a
         TKBGsbcKaHtv00JIFvhUrR89b6PtFLa4q+H7l1b7SDf6UnIRwjo/OTZpc5UojWHrNeBX
         JUnkVpuIjP8AqqjboZFmjWIa760E4De84NdUkxAKmCGOji+fbkbmS1NeOCTZueoEutcn
         hPRw==
X-Forwarded-Encrypted: i=1; AHgh+RolNKWP+IZXy4pfyVzYZcpkjGZDJeqt8sbCMxOkk86DWTpq7Ih9zOGAVxb/yF+2Im4Ebv/1Wx4KrL56@vger.kernel.org
X-Gm-Message-State: AOJu0YznDUQ4R3ckFDX9v64lbSxffdhPoKPsrblDxBJWP7vsQH0Zz7Uk
	rgcIAB3JC0nAfFyvVIBbGgqUTijSgIfhEIgPpoXThwST4SPCn50hDlfGWeykfxQYNE0iCJQNxyN
	QJuDPKXgPXfMDX7jPmYvW7U1VBdEzAHu6KSXLG+ysMT4ITc+kwbSM+JoZhNdgzmTI
X-Gm-Gg: AfdE7cmiF+E1xsM9Euv4s48lD5U5g2x0fvynjHZQxKcUHzVYYqyaol77TjiEJPLCNqa
	J2TlsybFVjLNQ9V3hiM6fIRI9ClvtWkeu0Spsvk/gdGpjgiw8IIWBdFsPeHnLo1HBu7U+ripspt
	4M411ilDDcmY7MpOb4epqZFgVylbXEdXR0y8YHuSl4k+6o+JJrkQzcv7PiZngLoGZw0GpHWfK0O
	WH2BYkWvl3VREY7Zz7g3tKo3ka0t9tz7wJgXNp+67Ltqndqw7GDHCLUEf4MmZ0xSO38XngVTHMQ
	7FTp/UPptxg8r3k2tC3vMLgn2WhLHl9ZyEoZHogFXuJ+H9Elewz5jf2zWmtFnC/U5sc5R/Pedqg
	0eO0IHUSXmkBlJJQVCF8WmTAy
X-Received: by 2002:ac8:5f47:0:b0:51b:e991:92bd with SMTP id d75a77b69052e-52674e0c561mr27287731cf.7.1784644193094;
        Tue, 21 Jul 2026 07:29:53 -0700 (PDT)
X-Received: by 2002:ac8:5f47:0:b0:51b:e991:92bd with SMTP id d75a77b69052e-52674e0c561mr27287371cf.7.1784644192705;
        Tue, 21 Jul 2026 07:29:52 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705a099e7sm598982766b.20.2026.07.21.07.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 07:29:51 -0700 (PDT)
Message-ID: <3507b575-0f66-4542-b86d-431763b237d1@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 16:29:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: eliza: Add PCIe PHY and
 controller nodes
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260721-eliza_evk-v3-0-92b10038f13d@oss.qualcomm.com>
 <20260721-eliza_evk-v3-1-92b10038f13d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260721-eliza_evk-v3-1-92b10038f13d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: acLpZTu7r_YXgdD1Y2I3i6loo6nUxdZB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1MyBTYWx0ZWRfX1oIy9pXHaS3C
 wvF8Pkt4NXC6d7UACbceQzwbgHCcRImwj579S1QlfpyOa+FjbHkbbW8KFMYR1ofdlAFeGg3WLRc
 42Bvo4OJMM2eeBmeV/6W2flwHzwGQT0=
X-Proofpoint-GUID: acLpZTu7r_YXgdD1Y2I3i6loo6nUxdZB
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a5f8261 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1MyBTYWx0ZWRfX9qKWMKJBop+7
 rbAsKqG41iO9lKsiM7/vtr6Egg4zavYwy8oQrMRGotJ4gcAukmTucL5EO+ZLTI+KUDlosrL2g50
 0nU3gwKn8v/RKsbTcOEpvvg8KGsJEy+5wIrX7358QSDlHZXv5BZYkbCgIeVIoJA27f153n1yplv
 LaH8rKh7Ni6UIInDLfy0/2+vx/GAHtxgcMJhDrvW7UC5Xc1wsmAY/dEbzbirACokEUtKIZfb1ul
 KJqt4M44Z2tH1E/NmRtIm42vMYCdiJddbb4cg/MLoW2nCL372bsvfozMvHaDI58Waxtup+MjOrg
 CjPuGsZSJqOV08XGPOgKheKZoGT1wbQUHYrOo8F5OlMeCwPD4GXSU75IJzkA+yZPfsQsnNCwt17
 AOIUGcE4Mko00Mb1rlLOO6Qo1SAoz0Hfjjmk3LXvmuRcdpNu42TGDgYtC0QqlIZoXAEw25SuVJA
 rFRvdx4mu4c/UTGqALw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210153

On 7/21/26 11:32 AM, Krishna Chaitanya Chundru wrote:
> Eliza supports two PCIe instances: one 8GT/s x1 (PCIe0) and one 8GT/s x2
> (PCIe1). Add PCIe controller and PHY nodes for both instances, and update
> the GCC clock references to use the newly added PHY nodes instead of
> placeholder zeros.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
