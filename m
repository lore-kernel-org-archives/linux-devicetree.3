Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079C219343E
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 05:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774329327; cv=none; b=Hwz//BS/Shh1ZBELEkZuZTUFTPuoS56kq7rB/WIt4sJ8RE/IWZwgpZVFdt1SnJ1sWSmvOpyPIP6Ya43cUUxMRcq7qI0f1T2EK9lohWSj6t6rEV+OGeh2zndWHfhU8mz5j/E1VqmEGeEUyTo0JMKLA11J7g9sme1DlCqFAcBNjp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774329327; c=relaxed/simple;
	bh=mFSN/Scch+iSBbvGZ6JEeuNoSUnRF4fKrQBINnoNrnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZErtY13pVlBv25kfrz+PbAt3xZMRCUdAdvk3HSAEaMFOaoaUEayIHqIr+PTB7NRDdxcnEgJS3JnIohWMkEWvHHsACHJnKyiAhp9UHle/giwwmz4jy91MWogOcF/bV6ePLEZndZzPhtLWtkfwfxnJdXH2ibU4Fa7MtHlCxctn1xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LKWhIp53; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZPZY6g4O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LKWhIp53";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZPZY6g4O"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O4dGh11909392
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 05:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fV7aXshRMXgRNymfOfiTCp/pI6NQFCBxOCj9Tnvy50U=; b=LKWhIp53IeBe/dwx
	4urY0ObI825FLxF3O8dMSncDZ8V/u23uu/QS9JN2JF5rU4YqGKbMGkKzttcR62r3
	br9Jt0Fi/OZpglK5hXZr4uWxhfG8l2OQz35eu4nxVoWpviLjURzHjFYI8W+Bccd3
	mz8mQLFaam8XxQ2FCVfTzykwH0DVQWEt8doRtHz9RFgnC1b8fq2COu4leHEThhLa
	j7n9X/vQ0cTRSeF/DM0EUsY/0DV0jNEVnYsbcbyAl88EHA6y9bS/hD7qcj7K8Nxx
	2ofjNGepfdwaRNWxsNZg/CM/C1MmgxXjKb1owNKz/A50DhIBDYYaz340FYBMDDM8
	kza3ww==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3awysu5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 05:15:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b091c3f891so26512955ad.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 22:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774329324; x=1774934124; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fV7aXshRMXgRNymfOfiTCp/pI6NQFCBxOCj9Tnvy50U=;
        b=ZPZY6g4Ortt8lBFBDlutVphddIR2TEl/g0QwJKFxmiaHCg37ra7daaXX0p1VrIuS23
         v/Z8Kn0CuTsZ66OEIyIvVMmmcIc2G/cChgcYXPAdig7+osqTh/Q7E7GwYJH1tdZKtYcN
         gXZLQ2ymxWMenHSbW2Mw4wDzOM5t2t9aGlo9Ii+YHNV7A75XHMa0sSJEvYERFxC86rjZ
         43a+B8jb39xDNAYLg2FYIHFPHIx16kcwPCX/uv2oH38zsY+KLOUi9Bx5G4Amaze+tbFW
         Xd/SZIUi/Pa1UAclGbgWBy2wZkpLiVU+IJCploi6Lxg7wE/FX/p8Cem19NccsGVbEoTD
         FZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774329324; x=1774934124;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fV7aXshRMXgRNymfOfiTCp/pI6NQFCBxOCj9Tnvy50U=;
        b=h+4T8koeOSFWUQ9ziQJDpmgBNqeD5US6vsrIU+zB9r5tk5VcSalhKezCS2d/ybQkyl
         7La2XgkJ9Fb28tn/SZMhgd4rZ5dfPAmUlztFT5r/Nr8q1LRyVUbYPRPPHDevdFc3uCFE
         ZBUi5fhpcrNHFtXLCFcjQZnkpTtbygsjd+DHfhjrRdMulVp7FSqwy+8KSyo1j1ZHae8p
         wT4r7susgsgfb0aqp2JnCXpJ/A7I4XeBC40dUws9I5AgI2J/TV59voGDVCpqr1vA4cFv
         zvEZv3vr5PaoGJxod3YN8Dh5Dk2MbTz2/1i65AwqAhujwmIIbnaEYgpvVgG4qqGPvImK
         /Kbg==
X-Forwarded-Encrypted: i=1; AJvYcCUigy/wdPRLBCsMzO5sRoI6iesGuzN7W3ERCDle2ZqBHEDeapGNdvS2EA/iYn1UtfmYJPGvuhA9Q5Nr@vger.kernel.org
X-Gm-Message-State: AOJu0YyixrNVdDT1jAxXLjUi8jdWOI0cAKPxKV9jjefwuMmBkVP+p0YH
	APuwQOa4WXli4dE1EIpSf+Z4o+fwlyIO/ikBjJdv+IkwY7g6ZJPlPXTsHyqDbxgExMqvX32Vs5L
	22adLdo7LkJf1jP1KEigBQrpo4LPpunHaVyABT2NeP2WZtEBjX+xqg5vjvloo9vVI
X-Gm-Gg: ATEYQzzFtcs0pTU0ffDI+7LjmUI6ghl5bdExFI5M6uAbnsVdHS4YaGppE5FmEZ/RmLI
	wjSeCkh+z2WWLyvFma/RoSPylC9Tpwo30krliyy86uOUjjEEtBahP8DMWXYQS+gdP92Uv+J3XMN
	sVCYXTMgKTwMmT3YMfEr6cSI09UvHb3bg376Kt6KluZnCaE32ehHtbTSDnCpRD7U2MYk0kXghku
	S+P/vZTjjHDPVEwpChTeXLmVZavoJsO1vVts491X5FEP8i8LjMz6tbn3eAas1Y1DFrvd5NIIw4D
	sNGN5MXVfsBE0gfQfPlbl5uu8sqb0I+5POq8bZhFMmmBBp8G+hyKlqc07lROUKzq4mTreER4Rc0
	GtO8z9WW0dJPP9Fs9Y5cT8/oFIsULp5vyX/C4oflYIbgLBlWHbULYHg==
X-Received: by 2002:a17:902:d48a:b0:2ae:6457:3099 with SMTP id d9443c01a7336-2b08277cae4mr133308555ad.26.1774329324524;
        Mon, 23 Mar 2026 22:15:24 -0700 (PDT)
X-Received: by 2002:a17:902:d48a:b0:2ae:6457:3099 with SMTP id d9443c01a7336-2b08277cae4mr133308175ad.26.1774329323989;
        Mon, 23 Mar 2026 22:15:23 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.233.113])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c74dsm174187005ad.62.2026.03.23.22.15.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 22:15:23 -0700 (PDT)
Message-ID: <9fa40f68-54f4-d684-9e80-511c1ab230f2@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 10:45:16 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 2/7] media: iris: switch to hardware mode after
 firmware boot
Content-Language: en-US
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260313-kaanapali-iris-v3-0-9c0d1a67af4b@oss.qualcomm.com>
 <20260313-kaanapali-iris-v3-2-9c0d1a67af4b@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260313-kaanapali-iris-v3-2-9c0d1a67af4b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA0MiBTYWx0ZWRfX1gOTmNqqUrfi
 s17mAwQkdGkWOaiPbJ9whe/eiKCdIcmJWMNrcysUAv5wq+yL1xoZy5J1d+cZGEcZ3QYtuOB1TM2
 CtIeZ0B8/2L2lj8Qmur0r7c2BCC/XDfKC+BJJp6/Lq6L4O1g6zU11BZiooJ5YfJx0APK7BH2U8R
 uyTDAswGSyGOODcShjblMJq4wrzXLNwsJT5hRPT4FKpgw0aa6vvTMXRctX7718/qN0JrxBdIvRM
 nmSGdy6rhBKjHTroypR5RGoMDyTsxcs9QPhbOH5bX1qSDmMblATNo3oMqE/8HsNst252FGuVWC+
 GTiMEjs7RKqZKSTADl13j1fGw7fYWa4moPi7aYXRu45rXeN4YZCiB5Q5DwRBjg1KgIDVh8j/jT+
 SGV6HsybDW4STDDpMfFXwnyl6GgNoEnMFQ5p4DNaj9LBK71Shdi380d1+WNjgwVhT3kSQcRDDkV
 5+J1XTvEcrY5LXFx7dw==
X-Proofpoint-ORIG-GUID: B4LV7GiVfEMw8GlwbRkcqeprBMQCKq3w
X-Authority-Analysis: v=2.4 cv=KuhAGGWN c=1 sm=1 tr=0 ts=69c21ded cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=hbzS8gabZINpAvasuVNEhA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=dE1MpONsbtOZy1RxgbwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: B4LV7GiVfEMw8GlwbRkcqeprBMQCKq3w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_01,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240042



On 3/13/2026 6:49 PM, Vikash Garodia wrote:
> Currently the driver switches the vcodec GDSC to hardware (HW) mode
> before firmware load and boot sequence. GDSC can be powered off, keeping
> in hw mode, thereby the vcodec registers programmed in TrustZone (TZ)
> carry default (reset) values.
> Move the transition to HW mode after firmware load and boot sequence.
> 
> The bug was exposed with driver configuring different stream ids to
> different devices via iommu-map. With registers carrying reset values,
> VPU would not generate desired stream-id, thereby leading to SMMU fault.
> 
> For vpu4, when GDSC is switched to HW mode, there is a need to perform
> the reset operation. Without reset, there are occassional issues of
> register corruption observed. Hence the vpu GDSC switch also involves
> the reset.
> 
> Fixes: dde659d37036 ("media: iris: Introduce vpu ops for vpu4 with necessary hooks")
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_core.c       |  4 ++++
>  drivers/media/platform/qcom/iris/iris_hfi_common.c |  4 ++++
>  drivers/media/platform/qcom/iris/iris_vpu2.c       |  1 +
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      |  9 +++-----
>  drivers/media/platform/qcom/iris/iris_vpu4x.c      | 24 ++++++++++++----------
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 16 +++++++++------
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |  3 +++
>  7 files changed, 38 insertions(+), 23 deletions(-)
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita
