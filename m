Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C34C449B0D
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 21:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784581281; cv=none; b=Nj+nwHJAJTG2DdisoUGJh6Wb/wG5GpdnrTRZZX6iiyH1lxn9WCJiuo51hN/Y6QohtyiVN0hNJUi6PvpBPx12hnq/u7a9y+0OdIwisszgyoDXtNwuAhayRJ9mTZX/G7Jp4AnBMMDEhrALwl8aRXOsUCpIfie48pmJ436pLgxBgjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784581281; c=relaxed/simple;
	bh=3XGxLc0kSNciOygeOoIGLBQnG5qvOMjdq9MJkYJBZA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QnAt9noE6FpdjSFnMbnP94VtJCS4e8FrKkCWKEnk3qTPuOy5U/cpfXOeB/lmzhRF8jkuoExQKvBS/rwA59RSNE0NVbkPU3a7f0d4RILTQUlDkP6Z3dynkjdyxVcjXND7CW/mTBqThgXqsIxVwDlX5F97MKnYO7Mf4UKH0g9s5bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pci748fs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W0mh8PLd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pci748fs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W0mh8PLd"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KJTQAE3283745
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 21:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BB5tZK0t6JhKP0DPoDzhP3tg
	rbpuccWSy4sN7P9ZZTc=; b=pci748fsCwct8R81OTYW/xKHomwvZVdulE3J9PIP
	VLIuN5Ovp+t7zraKmtib8JQVFzrk1HEbEHGjsjuJwY8XuT92P4cfWNZrsD/sRFYQ
	0+AbtVCLjHzqmr3w+hyi3XJainORM8DUZRVbm3FxdFqUPU69/Y2FE2LpPM6XSALo
	uBYTqGIBuOByk1xYSaYmW2RkG1IS4rQ83OLkeF8AUC4FfJtDr+zk+B04W81nJD3N
	sc4s3Oarh0duzxj+JUXFoZ699RVAO7/vjn73d4q4LKQIas33as2tXseH4lQp7MbN
	9W7MZ3DVJjUR/CTIRp/sIKES2ZwzELv1l2vWEydpl+BEPg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhh5y2yk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 21:01:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c21c01cf3so158967471cf.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 14:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784581279; x=1785186079; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BB5tZK0t6JhKP0DPoDzhP3tgrbpuccWSy4sN7P9ZZTc=;
        b=W0mh8PLddt4n80wLsb61l+vKi3i1Y9IS+MhwWpvUhpljtpph7oU9fkGQbXoaL1Pfnr
         KVfjTs+tfb/yFWwoKAW4aAKTu3e/bOEVrtN7uyCR48AFac3qw1yka95JzDFulXUWWz/x
         QPUDyEOtf1acyD3AmNNCNnqBeXIWZ1XW7nliHkA2sYSsTpiQCUGkE7fn/3umX9+68sDz
         rgzruznVaDMP7u9XvcLyC4FoF8VCwGQ4OU8rCXdsRbVPovsRxSIM//SXSKw8LBm/piJw
         9B0j+1GpIjdJ36Izjn5kzEgrNeCHR31c5IutpAp42EPwTYTt7jNjO/YgPz1+hQrDyAWJ
         NtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784581279; x=1785186079;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BB5tZK0t6JhKP0DPoDzhP3tgrbpuccWSy4sN7P9ZZTc=;
        b=HA49U2paLoZPuR0qGARSzVyiRMLtU9pKZpxAjbBzVONl5nJfRPBj7PBCNnIjSjrLy+
         9ltewNpj7Gcl1V/UGRyAnK9qrd0HDh2niSrPnvhRFyEwewF0o8MlLgn2lnhmwNNuCo6s
         Y00erZbX0zY/p2HH22lInl+/fCVIMMMPXuh0NtsFKBOdRqmZ4NTe3R2CBeEd/YcFJQVQ
         /9wcQ//KUX6jqKRX+ZjN79jY6l0FXTqnT7LDcftQChZbz5kQB20Prx/evO7YBkxFABVm
         9KPHicqqUUDGtLsnb895UPEkMouAV1qI/PUUuSdWry50n7KOcj36ns72t1ZhUGJUiotK
         gpWg==
X-Forwarded-Encrypted: i=1; AHgh+Rogs40HRlh/cW4q1m+azVrg+WajkBE062YFYjWzziMQPAWV2uAAqHT7xuY5taw/pway6IGjf3gnCjMr@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe8TkB2IymyrY+FmqYnQj/Rlbv//hz/zYmDqg5bLPdjcRtiHk6
	3YWVshdAxvCzzHMnuVt62cHzgi8Xz2vRaff+dkTp75rO+jt1Z6Nq2EkYUU6b5hajiwilwiMscjS
	2c2vD/h/Oi994yCMCm6//1PrK8ZlmLeqiQOPps8LFz3ofuWMxgWdoXO8s02hycVCL
X-Gm-Gg: AfdE7cl3U1iZ11V36Gwf69Yg+aLKM0lsJT8N3wgqQ+6bKZy2HxOJ3Kg9MuX78U0CN6Q
	m1WhNhWVoRGYPr24I7hH4LK97KiwOof3lmfqp1nRF/2igyuGX5vLZIbC6VUH/OBCLoeE2PxYRqY
	3Cwm5yjIVV+6iKiestVOKEXO43HFeml3WKk48KkCJZXemyCUzAgA0OFKXvxjIOICVVn2V5rhMvQ
	FPBQpLr7zXTvkxc2/ZA1CGLiosMk83Ww267ulCEB41Ub+o5FEvJh5dj+W1U/CKHOQJ+ryH+8JWp
	zvM5Oa6EHN789YyRqsbipiAO2Go+1uPSGHf2LWdMzr5uuKK/TVjju4NC1GDKNnlqXhbtYrY5rUo
	PM7ssby63tITs7vxg83eHNgrRce1deO6zyB4D8F2X6XzEQf+op3J/zHEq/iZSfrOv5isj0tUbf7
	yiMT1sXKtr+TJMEw==
X-Received: by 2002:ac8:5885:0:b0:51c:7b12:1212 with SMTP id d75a77b69052e-5214034500amr149456821cf.80.1784581278895;
        Mon, 20 Jul 2026 14:01:18 -0700 (PDT)
X-Received: by 2002:ac8:5885:0:b0:51c:7b12:1212 with SMTP id d75a77b69052e-5214034500amr149451861cf.80.1784581273516;
        Mon, 20 Jul 2026 14:01:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291d0fdd6sm2543171e87.0.2026.07.20.14.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 14:01:12 -0700 (PDT)
Date: Tue, 21 Jul 2026 00:01:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v3 2/3] clk: qcom: gcc-glymur: Enable runtime PM
Message-ID: <pg545p76r4lmnz3alukzikpra4sbcvoujvvisymp47lg2worgi@4tj4equp5rcm>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
 <20260715-glymur-fix-gcc-cx-scaling-v3-2-72eb5adad156@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715-glymur-fix-gcc-cx-scaling-v3-2-72eb5adad156@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDIyOSBTYWx0ZWRfX+1L3oXLHNimn
 zlmXujy+7qlR/ScaqQNL6yHZNCFH3grpWMy/bB0rOmzrrHoywCv+5p+kUziyMupvPskqX3JwnE+
 N66Jk7Rcrari4AHLXmK6krciMc4FRG4=
X-Proofpoint-GUID: C0WSD5nssglXBvvEHQQ4iHkpDGI7oCpw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDIyOSBTYWx0ZWRfX59+X70rnwrEd
 K2SE/uFKxm9kQSn2AYQRNu8ryjG65zG97BYiHE2QLmq6XLnKgXY+AfsXodWK8OsBfFxNU5wUSnn
 lD6tSIHIe5jIFjJb/csqD4ciBFCmJAgvD6FTGv7JRWXs6eYLEEq9kokXtpy85VKUWh3qNGNG++7
 yDkSrZOUbqPjd3jdzPSiMHXtxNBCibweA4LHG28sBUT+tirvd5vBMp6OcC9LSJRcmg+8xwvwO9i
 iz3sWXJCxWncM66hf7H9JwTrEnMyyqCp9GWIZaLZm1WteMyIIZobrVBLpHButx2z7FTK9lhL54w
 szSeJkF6NZUN8h7wHuVjD5CS4FZMeUyQUQfAcTF9F/viPyGsvXy/bkhwTVehTtw6McBXvUXHltb
 foUCOoryrKbPxPRwWRtiivHoWa6ayb3qj5DgwMgsF2qDdlXW/PUBWwX9+CPA3UHKiQtWnan70L0
 DoKuc11z1WtR1erGzaA==
X-Proofpoint-ORIG-GUID: C0WSD5nssglXBvvEHQQ4iHkpDGI7oCpw
X-Authority-Analysis: v=2.4 cv=f/x4wuyM c=1 sm=1 tr=0 ts=6a5e8c9f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=9JxFHelw-nvN-s8SXg4A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_05,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200229

On Wed, Jul 15, 2026 at 04:29:15PM +0300, Abel Vesa wrote:
> Enable runtime PM for the controller so the common GCC probe path resumes
> the attached domain while registering clocks, resets and GDSCs.
> 
> This lets GDSC consumers propagate their votes through the GCC provider to
> the CX parent domain.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-glymur.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
