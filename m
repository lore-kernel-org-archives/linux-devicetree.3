Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703285;
	b=3LpcC9w9vvyu2Bi3s7ZbVncsdqFggL2vQjSfzWPH0KqoEkjSE0GIMgWZG133bENJ2kLS
	 Kx5eOMoBUkWtnYoJKsBNpsf8T0y2/oXW6DKnUqJeNIF1T6DoRRH2OXvCpoUwW/cRpA0g5
	 Y4EWlZCo7XnTnZJPZtIa7AWONDt4zh3Ar8OtqBbQCLfRTxkOaeTdmXVGCx6naXEO1sBbn
	 tCwS28PwXkSKhOqfV1jWS/Pi7IsA3V8dIMwUryknnxpYNqJ7TP5gGYnF7/xzOrpjB7/bc
	 4OUpABxYb6f2NKAdz919mr43huKWjl1ZiUmc5LR0qtgsjUc5URQq94x9xdfSLoH/5+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703285;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7Hz+V0KZEUKwYNABkLWPKOt8inKUR57WAc+UGW03IoM=;
	b=5RC/jukFTwDfTN2bQb/KPg6u1dLH1oPtlJVxJI+AXbSdwec9NZZaBMjfDX7DMjCgl4N2
	 Asxfrizhb4NHOMWoWxWwvH8F05ro8fVtN5gfaYnzZ1qNpWP4mybEINpIUwZvxUepTVTAK
	 xws6Qw3J/SvM7wAKKHtLGmByFB9RSBt/LLkXVSomIPIeLNkitA4zLngFxsUMkftvf92/e
	 gC/SnKl/g7w2HKw3BJIUq4fTyPGv8FPuWD1mZbNeSu01REGXiz3H/8UOuBEW0q9dF3+u0
	 EOWP+BR810ERpVS0ofAMagtVpme/bgIV/7m9Hp3eopQCSX6zBr8hupHVK4Hmqa3HgsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fm2kgiL2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LPGL+WW0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B688606A32A
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:28:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B688606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fm2kgiL2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LPGL+WW0
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVHxd3476060
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Hz+V0KZEUKwYNABkLWPKOt8inKUR57WAc+UGW03IoM=; b=fm2kgiL2cWg5RwJ8
	HFdDWNUoA/yk0YZOV+8RUXoFikuYrhEynGi325nG2OdMCTsaD6075+EiYmzqgWzS
	NUMdf1qaw8OCS7RiLSRlXCYOim/qKu7wHtkPI028cqfcV5j45FiJLtIDoI5kM2lc
	3aZ3HgH8aiYp8EQ8q5SC5Oxat6cXZk2s6osE6GDLIDfw09v7D1VA+puPzUNv984p
	1HnqGwy7GfE7806+8ASg8vmx5EAu9UETLMRu5tprgpIc7ZaHRBK+sL+5mBF6uGf4
	LqcBLfWteZI2vXIwm8/y5iiq6UkNYEGoMnhmbgIe+Qkt1Dwlj+yyAGZrnwyBtAkQ
	n4G+gA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rhsd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:28:03 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91f2e2c3482so8115466d6.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795703281; x=1796308081; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Hz+V0KZEUKwYNABkLWPKOt8inKUR57WAc+UGW03IoM=;
        b=LPGL+WW0CNQSZgyUJVv3qTaXwKwIek/gD5cD4sTkGMlARFggt3x3OjVje4d3xmGM8T
         davkXLjrufxKtAe0ihK5INOJaqCBCf5Egpae2XqVuTPSn9ZqsKwdx3pVw0Nfj3Ac6nss
         gHmMQo3H37ufCblREUylVzN2L7wSz7rqkKEeyApfddre9PPl5l4Hqq0uj737OfD+MIMw
         9l2QAR7S1PqnM8ZJsamDB3Y6ypEs4ngmlOgEp1GOkMZjfzlLBzmvtq6/5/1Am8xkR32v
         DVTixpR1YtcEI3kn4Nr70+oIt8wCSXop7ILFcDpe5bp1DLj/3dAa4AXsrtTVrOznsS88
         JoJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703281; x=1796308081;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Hz+V0KZEUKwYNABkLWPKOt8inKUR57WAc+UGW03IoM=;
        b=bNsRpmRyyPsIPhpvBW4aXIMQ8FH/v3l9z5m3ob0O273S3WCN7ORE80CNMTZXO1QL32
         JUhVe9P9+g1F0h5AHRJQDi81/GcxTJYLywZwueoaVs/V5SO9+H0pf9KMOCdVUFhYC7vR
         AUq+66E8EX4vQ1ovjRjAL/Ce6GiG58Q1l2UxqWOgZHXLLvGPhcI8nfNJHHrGkweDib0H
         qtNR6mRY6181XkS6eEWx+7DZBacWPT/xQjVfVFjSxnIw3xly7BpU2hLJpZsD/c3ptdff
         mAKc6tphKSjaIbQHgzdAjYqPgIcc3rNMjB0uC+BF1vQXiOT0rJKPw0+zOD5xg7YM93ao
         fSHQ==
X-Forwarded-Encrypted: i=1; AL+hErGTVeDTtNoOhxGEg806uEq3FUl2/gwjvKmp84iRGDUpbKyilVRDrXncnAR5uIAaNUWr+QRmPJj44dH3@vger.kernel.org
X-Gm-Message-State: APuU4Z89bwU6wM4jaqa8PsfMSue4/vxnqin4yC0kqm1c1juFD5EUUrQv
	/t5KLGHCy/IxbeB7cBXUwC8GwrYO+MP3jcgaROoowL36ZlJyOmlz6Pj2G/e0dZcWpq8eo1TgTZH
	uVJa3OClrVrdYA4Cc62euDIA0VAdYhOXwJmPDvVB9VQobdbElydLAxClfK0nR+3TZ
X-Gm-Gg: AZFdTZcKESNrcQVb55mOYDBwUvS9rp3vLyx2AVQVq1RbyWkE61q7Cr0pIvxDBWuyCrh
	7f/FYsX2t/m1dvK6c7IgwwVcrqwFrfu6EfyxVGLfiOoLELeyYnAAakL6eMEsbMpRy5x/p/MDFrn
	UpRk+v+3Oe1W2ag28ojIDVSznfHR2gEJCHJkWfdE01udnlFOxWiYcP1I/9H6rp8Z1+jylkiCctK
	BmmvtxirbVJKSMBQLSoOepVmfAXZGGBmdPmnQIn9asmSnrZRgEyJAx/pJ1iqrCM9kiGsfQfcKtb
	Yfl+K4JQLQg0CDaFPw5eCKmRp7dR6TsFArQw2tXNxEw8G+NEB7XtHq28GeMnJj15IOsP/noDz6/
	W+RE+AAjydX8A7r6hfv+a3wRNfhKqSzQB7+p015MZOivDOskAkAZba+VRdBEQ9ntBFrCSCc8=
X-Received: by 2002:a05:620a:a914:b0:949:afe9:5539 with SMTP id af79cd13be357-949ba8e9975mr3995705785a.2.1795703281525;
        Thu, 26 Nov 2026 06:28:01 -0800 (PST)
X-Received: by 2002:a05:620a:a914:b0:949:afe9:5539 with SMTP id af79cd13be357-949ba8e9975mr3995701185a.2.1795703280974;
        Thu, 26 Nov 2026 06:28:00 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc73d3sm756279266b.64.2026.11.26.06.27.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:28:00 -0800 (PST)
Message-ID: <d7901f88-af08-4a62-bf0e-cd7d858ec405@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:27:56 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: qcom: sm8350: Vote the GPU memory
 bandwidth
To: me@fromdisposition.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20261105-b4-sm8350-gpu-v1-0-a7175cdd6512@fromdisposition.org>
 <20261105-b4-sm8350-gpu-v1-1-a7175cdd6512@fromdisposition.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261105-b4-sm8350-gpu-v1-1-a7175cdd6512@fromdisposition.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NiBTYWx0ZWRfX9Gps8n+oXwi8
 hlnrXjrH5x0kXgeS5WNNvDIVy/pa3le/rP/Uj3mL6Im9yqREhZa6TD3RnLM5/K3XSGFBI0fSB8D
 YxfMMjL++rrZAn4m1V8JxWXIOJ0cCVVVqGuZ3LQj8JVFaFBSDrOte4q6EscbGYaU7aHfVsZURWE
 NjmSYEIGGWmEypopLa4jaI6sUXRUev7Xbq0O5SVUETs6Y+Se0gJ4KQAVYvgiFGn84hb1wUfJv5l
 J3lFjgHfnhMGrbFZcPP3cB3k5mDuNlYQe34HnRYyqCearRRImk7GnMP6gc15HJREJheTKEf4p5b
 UPaHP0f/VBvQDmAKXX8I7YG2HTMrGUGtapP83QkAOR36b8qzfq7GHt2b8DT4vZL5SyQAkCUHC/k
 TIZ2S7LuDG5MlAaEjrimw8ISk2N2srNF9KJ12k0vifRdQMO9/RzJWsfzASQt2ni9rgpUS+ywMDL
 J9tp5i8BVd+7lWJEF8w==
X-Proofpoint-GUID: oy20RvGHJOUzOWPnq2qS7HX26cfE3Wts
X-Proofpoint-ORIG-GUID: oy20RvGHJOUzOWPnq2qS7HX26cfE3Wts
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NiBTYWx0ZWRfX9yCKtQeiPZpV
 rLj9Ui2b+X4KckAJdu2cOfA3xN9Ba14PwIMVTVfAlFxyf6mRJdpHxFIImFeZspvIrtD+bE//wmd
 VXNSp2H8QQ92bssZI16mkrvLo8WpLwM=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b0841f3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Tt5JBQAfAAAA:8 a=EUspDBNiAAAA:8 a=L780p2Jx1yd6vCQwJl0A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=kpHMOrJS8sLNr5ru0mYA:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260056

On 11/5/26 2:30 PM, Demeter Barna via B4 Relay wrote:
> From: Demeter Barna <me@fromdisposition.org>
> 
> The SM8350 GPU never asks for DDR bandwidth. On A660 the GMU gets a DDR
> table with only an "off" entry, so the driver leaves the vote to the OPP
> core, and the OPP core votes only when the GPU has an interconnect path
> and its OPPs carry a bandwidth. sm8350.dtsi has neither.
> 
> Add the GPU's path to DDR and give each OPP the peak bandwidth that
> Qualcomm's GPU tables for this SoC vote at that frequency on LPDDR5, as
> kodiak.dtsi does for its A635.
> 
> Signed-off-by: Demeter Barna <me@fromdisposition.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
