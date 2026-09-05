Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB59331ED6
	for <devicetree@vger.kernel.org>; Sat,  5 Sep 2026 05:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788587533; cv=none; b=dCHTCqpY3AgGBYRpV36PvQyLrQOCcrNUgu+qOjqpu8HDZsxAxgNy2ThHjJjfaUvvZ/uH6N4kXbXp3zPiDgq9TqTh25mpb3j7oGGltgzOeBcRRuCAM/yS9OXmCZbnPGBxpcL/uaYHnQdURpvruPlzZjlpUyLDpF0LeuNhDA5RN3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788587533; c=relaxed/simple;
	bh=VCgZulhWjhzIIXGSC8xV/CQTNWImQRFANTcRARb/d2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=biWBcPfiB6ngjkcAYoWFSQQXQ3ZrFL3sOQl72BObJjXDyUe/xsLhic7kZ1TbGmCYFqFsBgBE/Mu4urXc+/psVAhipI34i0xRTMYsDu9Lq5OZ3OwZTxXXE7NCYCbbfyt/SPSzu2vYWFpheWepjTMDnhlOC5Hp4yqjUNcppQglQLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iYFVUoth; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9ETN3jw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iYFVUoth";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B9ETN3jw"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6854ppa51435100
	for <devicetree@vger.kernel.org>; Sat, 5 Sep 2026 05:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j7nsHNNxpI/tRDTwXhjFh0B0
	jwLc40QNi8z6YFniWdI=; b=iYFVUothyuaD8EDR8yd/nN6Xqb9Z6ZtOPbcXFtPW
	6GqnDA2KcS8odx08io1yY6Ihvir7wNegTZ+k316NyqGuSp0VUvVvUKe8t6jm310u
	3JwhqgpXDfodUplwSHs+JkP6mT2Pd8cbmJu3jy5zp5uTlyM9Ej7beri0YbZc5XiZ
	4Cmt2xYlHGV14XxpbSWM0Hez3HisrInt2frJQOtJThDl5IFnHA6HgshJTU5joGNC
	9gasHi4xDzD4oXH6kXqaH1npRnudRxKFT6JLB4WIUOD+QpMIKmtLc9t2DpiwP/GS
	KZvb6NjWcVFXoK0FRCPBRAOyb0r3ZJHx+z37WGYpm6aK0w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg8eq0r5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 05 Sep 2026 05:52:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so384554185a.2
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 22:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788587531; x=1789192331; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j7nsHNNxpI/tRDTwXhjFh0B0jwLc40QNi8z6YFniWdI=;
        b=B9ETN3jwRMPKAmBK4+MT5mqnpCcGXn+v4P7qUcl3sDj5TtKiafNmcJaYFCviR53jpn
         rupBlcKgpq8lm5EoEjoKv0ipDrNHXyCzX8Clu7XzXkm5Jut0uRhqQjBUWqVmJbjXc08Z
         ehhc9eKSQtevOf6bS/9rSATTFuIJcstlzWavh23yTaqLaIp+TJdQmordxUnt/gJARjE0
         KLhLj8CavURGNi+IDUHdZGKlNrl/FTfWdBDRRd/tU81kbaPc347ogJowJUVtWoG/N4Tk
         jqlY30pNOdq8HiToFnE6UzJn9kVq2O+b7d+XXGLLz//IidrF/cUGXiMM+VhbOrbufzGX
         4Qvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788587531; x=1789192331;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j7nsHNNxpI/tRDTwXhjFh0B0jwLc40QNi8z6YFniWdI=;
        b=LvYAvTMrwqp51bmQC/f80lwHx59VC3JBwSVogtsec38IO60T2MGgDsnH/MKOY3wb+S
         P9ealUM0znHgu4PLqZtEHJXL7Kkj3AiAwT86YbNpy94v80mm1JBWTS7E3m7mkpTF280n
         Yt6h6cgoFgpaN1+2GHvKnMN20QvtIdsjWFOZo6zCTRpzN8HSk1AOz9hzcBVsOTO1StmZ
         5NNxC3anuvGlbLenxv+qr4X/+KgBObmSbfMlc2e+VVF7SM8cQC0Smj1q9xy6B5gMzu3Q
         QsrVoAX8LFkmGz/ELv4yFPPfMPzw8x+nJjw+/nn2ObsDsFozood+dQbKTILIFj3nDToR
         TFAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxOmdToucsBtvILHW2kwuisAGMkCMbi3Yz5Ky3bSDxROlRG3nx3BMdZaXIo2FavpIXPg8I9G0izJDU@vger.kernel.org
X-Gm-Message-State: AFuF++mniq261yJAmQAybN19RDWY0ekVHsYLBES5iD5wcKs81HrkRv3+
	KbczYjxIgjeVdlERrENybsCgasHF6P5zRXzzaxVt5MjXWWAx88BKo68TPdF3NvQO3oBKKWT8Jnw
	G4KowxjAuKrRSJzbF1z+9FAm16Pl6zWMZ//+48FkhFbZnQlLjx8BAUiNh+33ZVNx+
X-Gm-Gg: AYBFou0N2oQ9pqvWg0cjr6zF/4piWCfQRiCOPHeN+FIal75AOcm3RJlOQB8NsrLvJQ8
	pQ90fReUEPYHLy0LPZjLvRcAEY5EhdTQY3tB7e2+o2HKrXP40a7hfCfENtkKK1x3H19Ttsm8BFK
	usD5PYRGvPBtm76GnEHMQ/615D9l6/4k12MGn8dIZEuZCJHlD/luEfk0VrNnw+yjHZEKvxqTx49
	nj8uyBIQ+jJXwfvFYiqiBB24ZAhXjLLtFi0hqyzjX0hOgQG9SFIhziCH7th1Gkey3gYSLGHQ6Z7
	fcP/L1OpVVa7L6fhJk3SHaxv1GaR9M5M6e/SyscRFCVnCCP3cL9yzrEUi7pJ8R64HoPiRSit1QA
	l/MYd0rdjMsA4
X-Received: by 2002:a05:620a:3d16:b0:939:6de8:43dc with SMTP id af79cd13be357-939804e54c0mr754289885a.48.1788587530680;
        Fri, 04 Sep 2026 22:52:10 -0700 (PDT)
X-Received: by 2002:a05:620a:3d16:b0:939:6de8:43dc with SMTP id af79cd13be357-939804e54c0mr754287685a.48.1788587530212;
        Fri, 04 Sep 2026 22:52:10 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm497881635e9.0.2026.09.04.22.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 22:52:09 -0700 (PDT)
Date: Sat, 5 Sep 2026 08:52:07 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: qcom: rpmhcc: Add LNBB clocks support for Glymur
Message-ID: <he3muoyyhyd4rclkrvy2ut36rzvp4kdusabpvevcrfo7tw3plp@yddqy4afyuym>
References: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
 <20260905-glymur-ufs-clk-changes-v1-2-cdff2c67a8c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905-glymur-ufs-clk-changes-v1-2-cdff2c67a8c2@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=F61nsKhN c=1 sm=1 tr=0 ts=6a9bae0b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=hGZaFhyMRkl_5wbcdfwA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDA1OSBTYWx0ZWRfX7Lc1cxdKUCvV
 zRg8X/7gwrqpWu27PKBOL2BAQkbzkT2jdvOLGMxzjUCXWDQT0qW2FRmLxQ3h0LDYzEB4pQOaPOc
 z5G/JnULsQcQIhEkR6teSS45XO3ElCg=
X-Proofpoint-ORIG-GUID: bikOlyW_XZr-7b8MV1pUbCGLJJWD__iB
X-Proofpoint-GUID: bikOlyW_XZr-7b8MV1pUbCGLJJWD__iB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDA1OSBTYWx0ZWRfXwoGcI5aQNkwT
 7W8Mt+hdW+jrThA1/cp7tA4qqaGbB5r/dnXloVkKsBu9dqqfhIY9pF+3oQJy921le+lxF1vO3C7
 6386/fQEGtjnS4IKd+oZLccdAhtMShqNavqx8dl0M/NEfhpwmz1+Gsdk4U7tISXRSweQHnnNxsR
 gX/6VDachHRJx/Gx+eEEghCiir38RomBZzN7eRQZ+OwNQDOxirHrseounx6eQZmZHtWdDdUlwhS
 XneqM6QcSaZlbWrR0bNWB7hSPYF7nejmyWtofxNINrsH2qrhyFaE/68ZdAUvsYgCVbLjbgaIQrz
 eB55h1EakWmBtWZU+akiENpyc6UFTTzlrfzGjqOvhTbEsMkhBs73nFOZcNiR4be505PHuD00KxA
 sDxzJeysga3pdt56CneKqC7IVipPO5l+FGbzBIVn/lL/nv3ePZXDE6hh3vgO98jwTDxuX/yaFOP
 1K6PlHdZ6p+NY86aaeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609050059

On 26-09-05 00:20:43, Jagadeesh Kona wrote:
> Add support for rpmh LN_BB_CLK2 and LN_BB_CLK3 clocks on Qualcomm Glymur
> platform.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

No fixes tag?
