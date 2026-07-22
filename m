Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F64535F192
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 02:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784688147; cv=none; b=HmxEE7H/x5MYzoNPYOVDzANnTWcf6f2NK4MZq6W9oZ4dFkyvuy1eg0Oeh5KTztGztTMseQLQQhUXveGDYACTwcdkNVSHo/FIYBOzXx/PNCZ5VeiuQcIUBLm2dEqw2Ln+iagtVckkEJ5yAwvDjEOyTEosfIV1CMmmlQsCSt/sFaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784688147; c=relaxed/simple;
	bh=+jEgsXPIlpAf/t6BKT7RmtRHh01YWYWKVlVQ/dPgotM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FFbzj+EL/hYlhpIC5VquWr9c8xMtDYhZHNVhB7/Lhwn3mTL3zyXBXf/nW2Y8tKUM0pzz1kK+O4FpiXgKBtCndI10x6S5usPoq3NNJRkkfCfCKa0IjSHtv+ysgGHWOKsMEfD73KnjYrZarzEt1vnJSgQs5xeoW8rZkQ++CmjR1KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gIxlisE0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dQ6SbIeG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gIxlisE0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dQ6SbIeG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M1CUJT3366675
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 02:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yXuAeo8pGEzyDVWBXPKIatrC
	tMlfuBJ15P+LipzkFi4=; b=gIxlisE0cD/uz3lZAwRj4vD5mCzi8OnjnM2qwHaW
	93hpFeQ5P5wWJTuMGbUE28kS9rTI6lDtfm63f0B/JrOeguaQyb6hapGXLTg49jXp
	uWXtMeIjLHnMZKap57wlSCsKOCvmK37HcT5QETO8IHx8HpC5nqdYN9h3ZcfylEzm
	GQEtthBedRIB3nEfLwatpkml9ZZR8+zbWvXWLIdGYhvW9YmReiAQkUJ9aVI6grG9
	Xk1BsjYaQCRBJ1ePYTKEkyHhNXxYohJxgKXzRrGSY61APouVIwmTqrU3Kb9OIybg
	0sTmu0k1tEFeCdgy5lxnipoM7aLlRSb3TwmGKvEiQ4czQQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6pabwac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 02:42:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce8a76df2dso219536385ad.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 19:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784688144; x=1785292944; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yXuAeo8pGEzyDVWBXPKIatrCtMlfuBJ15P+LipzkFi4=;
        b=dQ6SbIeGyi+Gomrxu67Ekw6qdA+Grr7fxta4K/r+3565+bv1ZeZhFsn4xY0GNlt3Tf
         g6W5fx8Ol2o4VSnRIqZIPzjnGvllN9JTikV6eAbTXGSzYKjzJ6KkbOuGmZwiGnWl3Yaq
         94et9DP6P2Xy5jKCbJVRExtO4pVFzedREID+p8AJl7x6A5xMTRFy+lRGcvyhsVkkFnr5
         p5uizvnrjY9h9HlhPLy81qdpVfkVtHBMEOq4Aw0imKMKXvNMdAjBMHIuVo6iIbv5hK2n
         +nrXOUq2jXb+hT0ireqHZVRcIvV6VmD5Yg+qrm8gGx3quuQ4PRFJrJa3GBkxP7zLuhkz
         nAhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784688144; x=1785292944;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yXuAeo8pGEzyDVWBXPKIatrCtMlfuBJ15P+LipzkFi4=;
        b=MlND+AG9VN8rpyMg4uOJEhnU5sFVKbyD0x1pmx9Ybo0Z2vTDUORtDaJjMy7CwXPs39
         ClgaMyeL+u58hsKzCyWGvFXOSjpTDoplX9cPMa5yu5ekV9VXcm9OGgYH0x+Ldb5Q+T3f
         cntPfEVTXWtz3Jp8k6y9P3xr07JoBbMs3l41rgKSsXA/N/O+7Q+fpi/CQXB3sIx7r6di
         KbMEHE/IBMcihXBxujBadAzpL+ggXHeMJpr2rz+lejp9WE65MP6uMVczzTvNOm4yh1CL
         p7iHm66vAU6tRLQWWa3StK9OrClJdrGGCtGlLRKdSHqkmCYL1J7fqhxZv9ee6VnI11mK
         n0cw==
X-Forwarded-Encrypted: i=1; AHgh+RpLD3ozmo6Lob0zAfHw9WA8P6FWj51XVRc0q0rja/qyxmjfWWpcEW0CsFM5Qa9MvDkUtIqEMqDpa8qE@vger.kernel.org
X-Gm-Message-State: AOJu0YxU0DMyIafpp18Wl05Sca7u3wVL5MfOuZDGPBivfLHkjIhS1KQY
	dnNQBVieii/i05USQDkURFyBbNl25BaIUUM9ikFzH2UUwFlTv6BnmndaDKITby4Woiz3GgeCPNu
	RVmi0Kzq0pq5It4Hn8AloFxCh29RftjMvlGnMD3LxtJKG4KH/iaSLhE6r8HLp5/Ns
X-Gm-Gg: AR+sD10Cr+/L9D7E3TauN4+mGP9+SJxRvnhIr6fvnM16lYX0bkq48k+dFVeQ6MgmGPC
	7LMOVCrwix6u2czE2jBpZqus9uDc1em2vvADyBU+KxLHD0U9w3GPDcCvvB5ZHGpJhlL8WzhHnqQ
	wRy2B/1xmc4ymxhqf6393++gULUciqVcEvs20GNJy7LsrJo22NAqhw9xUUbaNA7zdEt93uo44zh
	V9LChSAWRCXpoMYT3+pnEp9xciOSbFs/SM1DYZx9d8SFm0uDgAGiM8ZTCP4jziKwKR2eBunyNlb
	Jesma890mFpAMkV+BbvuTu2VHe2wFXPHknYDKw8Fq7nuGyVzuCXeJFwWK5tgooL3Kc68S41TJtH
	sukIQo+laRz+DMXLqtbQZjP6rGxDeWn/GikNJ6dY1GvU=
X-Received: by 2002:a17:903:298c:b0:2ca:4b7a:4a02 with SMTP id d9443c01a7336-2cf34a7bfe4mr225540215ad.43.1784688144439;
        Tue, 21 Jul 2026 19:42:24 -0700 (PDT)
X-Received: by 2002:a17:903:298c:b0:2ca:4b7a:4a02 with SMTP id d9443c01a7336-2cf34a7bfe4mr225539865ad.43.1784688143966;
        Tue, 21 Jul 2026 19:42:23 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1ca3efsm3868069eec.30.2026.07.21.19.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 19:42:23 -0700 (PDT)
Date: Wed, 22 Jul 2026 10:42:16 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 6/6] clk: qcom: gpucc: Add Nord graphics clock
 controller support
Message-ID: <amAuCHuElKhkoIfM@QCOM-aGQu4IUr3Y>
References: <20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com>
 <20260721-nords_mm_v1-v2-6-17e5a445a512@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-nords_mm_v1-v2-6-17e5a445a512@oss.qualcomm.com>
X-Proofpoint-GUID: UwXWc6qUFqppezO5MdYt17niku_FvWi6
X-Proofpoint-ORIG-GUID: UwXWc6qUFqppezO5MdYt17niku_FvWi6
X-Authority-Analysis: v=2.4 cv=eYYNubEH c=1 sm=1 tr=0 ts=6a602e11 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=cQiK_xN199hq2pa4WXYA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAyMyBTYWx0ZWRfX7Gsm9u8uT2cX
 Nh0Kfsy5vGDIwS4XDhNxWtAqivgVMsfZpT0EZdEAsgvk92+f012QV2edSi1CNF0vd86ijh3eePZ
 2wV0Fm1zXEffmp9h+AFtBWV6O8sWiY9xpkOf5/swbpP1hEf1vkg9MUaSUeeyXo6fc7bKXeEZOK3
 oZ4fZRRKXeFYDcp/5n8PxGnVDQCEyeEDQbHpuN2wsg/L4MoHp23octGacnbC3o1loBimRPKYnFu
 edpGHB+0lkoG4kpjU6yFbnDMtvGmKVRY/EOnnfCb4K/A4PzN46uEryJEx33d1JZvcqBQWEZyZcW
 GwbxrzLWqtm5qBuzJB4vqqbGPvV4MEg8Eavhpjjo9M15T5LiqijdgdqpUU29fY+s4RDHBG7gYvL
 g/fOKOt1R+2/uTyZuOr9MiCV3ahiPYZXnTrrdW6iXGs6xnxcPbVzyysAxjSYJVLnaFK44x80M9g
 IDrBU4AMWM5Hcjdrnfg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAyMyBTYWx0ZWRfXztaru5xYG1kM
 2kCAl3+g4bqI39ddLUdm/8SvFHoZtF+Pc5JU8cP694dGxUPGTufv/S8LY9FzYQlfJ/pOhDvFzXB
 sWyTtq7sK+9PDt+ygqHVqNlRp8IEKfI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_01,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220023

On Tue, Jul 21, 2026 at 12:37:21PM +0530, Taniya Das wrote:
> Add support for the GPU clock controllers (GPUCC) on the Qualcomm
> Nord platform.
> 
> The platform includes two GPU clock controller instances,GPUCC
> and GPU2CC. Register support for both controllers, which provide
> clocks required for the graphics subsystem.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
