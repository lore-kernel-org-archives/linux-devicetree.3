Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A3F3655D4
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 11:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785844311; cv=none; b=KhERn9vDXzV6iH5+eJdyHU/OaPhjBSXDzH7hHCM901wC4eWQh5fMTMqDODstoFpDEz5PxVBq5chbACWAzy/RnWUduJ1sjgvP4up3I2FFaPyEarqqadhRR7wWWBvirtfodTD+GS88BG1a3/gJQyH1m4R7MKUeZubDhEg6lc9M01s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785844311; c=relaxed/simple;
	bh=NFBHq2K5YXVs77JpjGHzOD9w0YDDqt05ghtTmidMy00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VWJ1Vr6JT/ixSBFZun2yTCWe7UmhQ4Z3Hf+dLaiu0AAQPJFbQUB1uDgSk5Zh1ul8Bz0/omXt6kyiaoB+DbA/CiZsWYO6SLX1eWltf92qH3VfYV6DUfat19vnI9xNBlGGamXaVeyVSJ9HdVt/jPqbzf2vedBtNghzgycYda/Lzs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cmsjHgfm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OZrcEk4p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cmsjHgfm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OZrcEk4p"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748C0mT3016210
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 11:51:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ze98RxjUZ4ItEu90Mq8Gu+jH
	l28YEoO98sbI96+/AEg=; b=cmsjHgfmnvAXfXQb9WqiIIH29tCv4MV9KMIJq7+H
	0cUQK6Ru+CSAuuizdIb2R6MbPOLIZs7s+nJWwCexLzEz7Pm4AWcI5WHvpTDJcUgk
	h+8pdvSh4wI4hs63QiBAznKd4waFgfanquTfOvZJWGSCEAMgYk+CeSfnjOKrS3Y0
	KASnaPev3x2tKWcJU2O1d9U/XNG662unF4w0nATs45+Nj7lCYq7zk/3+QCzhouyc
	H8YKR4i9OJRTu2DarGRGjqt8fe4IqLSsY83VHtqI6DQ6wWFi5G9Tq8GtNgjq+bqC
	hGMXtWEgX35yB8iQm49nacKj5RBSNIADa6UuXW/hUn2wrg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu72726fd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 11:51:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52769fc3f2eso49976851cf.0
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 04:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785844309; x=1786449109; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ze98RxjUZ4ItEu90Mq8Gu+jHl28YEoO98sbI96+/AEg=;
        b=OZrcEk4pFwmdUWbbqXSrM/a3ThCva3jCe/Siuse1GVvM8j64+Z2GM4s5qLy1+Y5RCC
         qED5UdhH1yuvJPv4U26of6Aqw+ZZttvvK2M0x+9ZWETT9lovarQiA9E34FF43b0gCoMN
         BNrlV9r+Xtxuz/7gqvsor7XwejPipAneqfN9qqWSD1WFaf5STbqPPuVGzEY8spm82igB
         +CVcqeucgSvHzSi8ahScmPHMMSQq4s3ODPVHnD8x6LA5SEXHh5zK2x7mC/GmB/F9JdqD
         EpB5TTt6EsktDBqkUzwq8+En3XQ3Gb/BLJlho2sP9M5+equguP3+53u6gyAK67nF67PM
         Pl+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785844309; x=1786449109;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ze98RxjUZ4ItEu90Mq8Gu+jHl28YEoO98sbI96+/AEg=;
        b=SSHYKy0QG4az8aZdTFKDiOCIv4BAW1GgEVl4MX7+awOUJ76s6s5DZLjnaI0sUCB7rL
         mvmsG5c5Qlpxby5lptgvhRNqNCbe8f3M/I2BdrTCFsR5TMwTFy/Kg9dgNjVQXD58PcZm
         eg0PtXNwvmPOev2XsXu/oE7z7TIYtMErcbhzjm++k7lw8duoL1g4Rc7XTtcdDeNsLtbB
         ZPyOav4cB5kGGxT3U2kROeRbBbTCVcPFsLBb5QoDhf/UevLDxy2yePIk8aP4KRwuY34y
         lxY3k/A42FloCFj30NqKhBs+EuYKBg4E0Y6Ll+pOBvSstOcgfYs8NbpPie18Jenys3mf
         mbhw==
X-Forwarded-Encrypted: i=1; AHgh+Rr6gtvdUTibQgj459pKGsV+u9jCxKSyfeymuHduQ4l71TlmJlTckj5ZsDIWm1eAqVvx4CyAwpyWL+l4@vger.kernel.org
X-Gm-Message-State: AOJu0YwOVdUITy0CS35Ql1ZAokcyenSM77YqvOdP6OUU1ztCYViNtA0f
	rvh/eJHeGE5So0CHi0UE70vmJPzVvB1eQeKq/J4rb6ijo0noyvNiUxLrUgftWTjnanw8FtYfaWo
	9KZyGsPHq2bklc9R6lIP9pxZQtu0vXAHN7dxpr97cvKhmWqWzeGEosPwrXb7VTQB0
X-Gm-Gg: AR+sD11pGc+kiq6KgYcsz+9dV8JIVXQWzrV4jfdY+69zpSVLjbLv4AXSPEZzZ+HFppz
	4Mk5RYTfpHZgWH1pDStwKD4f73LugoNV6CxO3NREMZGk2PcV2zxyzPyPoPpfVgIk4lBezFrEyEA
	GWxRgwJhP9L0EgRpxmPHRpE9fX8KZXer0+c69HdWe+ECInkIt7Va6ZudpyXkNY4F2wctxm6NyCL
	/SLgtBf6dEVjzlYXf7rVUzLSXH4DXdiLqL0P8m9O7JkbQ5ClWSZwNJkWv8zkKGmi6K6cH4tteZL
	gC6LCHcQMOPa9OjeV+8upa5jQReBQa2NIHE4KabNmo+j0dFTgYV8NnqRzv0x9bCj7AsD9AcPd29
	A9+J8n0m5RD3GeQ==
X-Received: by 2002:a05:622a:1927:b0:529:e058:d185 with SMTP id d75a77b69052e-52b56751886mr271519511cf.24.1785844308756;
        Tue, 04 Aug 2026 04:51:48 -0700 (PDT)
X-Received: by 2002:a05:622a:1927:b0:529:e058:d185 with SMTP id d75a77b69052e-52b56751886mr271518991cf.24.1785844308168;
        Tue, 04 Aug 2026 04:51:48 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.37.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458bf7csm45059686f8f.32.2026.08.04.04.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 04:51:47 -0700 (PDT)
Date: Tue, 4 Aug 2026 14:51:45 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH 26/28] arm64: dts: qcom: eliza-mtp: Fix swapped USB QMP
 PHY vdda-phy/vdda-pll supplies
Message-ID: <tiln6lkf63i6ezelo46alawu5yxl2rqu5x7kiz2emre5g65ctr@mad73j5h5xyr>
References: <20260803-phy-supply-fix-v1-0-5880630cde3e@oss.qualcomm.com>
 <20260803-phy-supply-fix-v1-26-5880630cde3e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803-phy-supply-fix-v1-26-5880630cde3e@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA5NSBTYWx0ZWRfXzpwYj/32Pfaa
 6AA5AYSYXIyb8LiQJ1Gn9yJkdVyVMbHfy5f552KEDWg5KxkCiMjKHku0uK/PC7cO0+1UyWuycZ+
 VE2EvUtsSx+9D1DgLVz8Z3EG63dgidM=
X-Authority-Analysis: v=2.4 cv=Z6Lc2nRA c=1 sm=1 tr=0 ts=6a71d255 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Afnz6uBANMlDQL2PJxecKw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=OGV9TLrtSMBsBMb3FhMA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: XAC38QqHwaJ3SKqeDEWKO2jtDqpUqQPj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA5NSBTYWx0ZWRfXyv0z9MIEVhLq
 tmWzB6JaUkgTzTMe9MykwfHANNt8IRCVwIVNAZnRPGYxw8jJ/bZ7xac1iFyIV96kG8FsOx3dJDd
 TYyhWLePIrG5EYrZj5ZT9BfCFfwoTzWIWx721ljblY+nR5LrU02LCIn1XxHThL6FA66pqPXCdKJ
 LqAIOkVQyJ9hmjqQDo39f5fuu8AKnSqVvDbalZ8vzf5NE5g9RUZVcM34yNG6qDwALTzf7OE2yqP
 7ezVLzudiYHNoQYXgkbNv/oqnj/Z6Uot4kZMUf4eu9th3Av5ErVTOcbFFpFtpEL+Kn9laBBT3Oo
 vEiLq5lnRo6htLEqzCCirIBlRnLvMMPoCNPS7sYhXSLA9drGu8YSnf0ZWkp8QqtGx6kYsQ02Hnk
 FeWr/Q4Og9nsmnTVkew5PBvnhOkqVmiqZiXaMH/S8ERCv7dh0969q8AFnXvNEMpV50/aeSggSIs
 khi2ZONIAU8+eoInRew==
X-Proofpoint-ORIG-GUID: XAC38QqHwaJ3SKqeDEWKO2jtDqpUqQPj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040095

On 26-08-03 08:34:24, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> The QMP PHY expects the vdda-phy supply to be the lower voltage (~0.8V)
> and the vdda-pll supply to be the higher voltage (~1.2V), as used by the
> UFS QMP PHY on this SoC. But these two supplies are swapped for the USB
> QMP PHY on this board, feeding 1.15V to vdda-phy and 0.72V to vdda-pll.
> 
> Fix it by swapping the two supplies back.
> 
> Fixes: 49dab7311f57 ("arm64: dts: qcom: eliza-mtp: Enable USB and ADSP support")
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Assisted-by: Claude:opus-4-8
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
