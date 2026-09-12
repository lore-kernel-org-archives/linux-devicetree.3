Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88AC38398F
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 15:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789227412; cv=none; b=hJSji5zVd5q+91AvZw3OkXqRFLAwLBtzAb8HngHSKlmOdWW+cyt8P4fOu/1qpe/ffqPYMOYkBxvjAPRtFeDV+0xsrYIKYZAPuJfdobLfeNfGubVA1AJJXRSjI6Op41AemBZeBDmFiUh9XffRRYncX2aGyGqTC6fVZ2BDZE8sjwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789227412; c=relaxed/simple;
	bh=5+z/T0zRXn+xjmvFdyxFVa20FKeIoctl8Vsxn2GO1HU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dKv46hqAmcBEBrWlGjP1z6MT2JUQ4QQVoys2Qamg+HIVEgIRXy/PM9j2cmfx9uTj0HwO+eygroURzHrB/E1iRRysjXuWaKS8M33wiiA92yWt7jOGwDXulyNCuh6yfiXlCQto5Pf9atSGOi+Mx1J6o8DCYszOd7331x3rN45KVrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aqoeC8fQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZNvcL+lt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aqoeC8fQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZNvcL+lt"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CEdVMM4128198
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 15:36:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rH/IEqmAkYrTTbJdUOTSduna
	mr9PJLC1X6Zur1mXdvE=; b=aqoeC8fQ5sLvEjnvTf/4WxXyIevy8YYchE6UbkfX
	OkahyrjwKK3m9da7K7t/Cw2DUWOD8weyrXrXsX1Ej2f9nxtzMZ0HAy/xrvk0cY9A
	fk9SvJPOtPVx5zEhOroEyIEdWEdgRVGJqG9B/CZ88D/6p/UXYYdF1xWBA9f69WSk
	agOpHf+s9mQf3qnluXgAAtZEZskmh27QWrWuUU97S7EpSLyBOva0DDWVBQltB6ml
	mBy+Tdxv8OcrJ8w1uoJeQLLrz0FuJ1SgUCWc0KiOdqUaxxoi1QXf5UQeskSR1yJJ
	+KbJTVc/x3ZhP8gEC1ni+3jEFtO/G2/okkmz9AS9EoLlrA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c9a7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 15:36:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93903622880so615025285a.0
        for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 08:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789227409; x=1789832209; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rH/IEqmAkYrTTbJdUOTSdunamr9PJLC1X6Zur1mXdvE=;
        b=ZNvcL+ltesOmjoRzaQC9KHXYENO8OSt3bjsV6OzLbhhhnu098rb09oQR5CPqGpavm3
         DazbcM4yP0GRp5ylUqxvbPwJY6Og5VMiDUad/zFrnNom0Ln4U+dLtfTsarN4JwXdeGLL
         JvInoo6OzQSaYzoZZf6Q6SkNmz0do+uR+4mnJL54cwFSHNWtFJXBDqjcD0uaqNzcCY5+
         0K85RiIWpc2aE83pmwYGDusnk+Mrh5ypXyQ70SKrczzFaPpb7DmWidtS+qxKFl++d7iR
         l+efX+qadEQ6pvJU3TDU3RbVcdrOG+gStgLUfasYtcHiJjiz/PJyTVe4yPv91ZE7Wr3R
         2ixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789227409; x=1789832209;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rH/IEqmAkYrTTbJdUOTSdunamr9PJLC1X6Zur1mXdvE=;
        b=nyBueUBq6FNsdPwyd/VFiOE8tV8OqVEx2I5pUMEyGPPFYeF0DhWiYBhAax3fkgoGgq
         8pVNhLnjbTGmOEgzjWgZxXGzXVb4asPEcOkWRDlZKTvUt/iCdpRutlirJKIsib+IsY7z
         eMVtFlAL6pF7Q8kLs+USECdEh+8uQr3x0sFJTjgAKodzDSyFtXDl2OFJG/5uvyLsQcZb
         OPW7pQB/C0+dcWMo4x88PB4+7+p5yrIdk4IbIqznZvD881UWKLjfr1EpjgJcBgYHi5Hm
         LvnCs9ZbnjrHDkgzKnmwWCPBAatvO2ggTTjCRj8XaUTuau+/ghLmT3Nnu8eon9azj5jS
         PGMQ==
X-Forwarded-Encrypted: i=1; AKwUvBywXabrMnjv68f9OHM/9pYEW0F6SR/fbzh+jqmv/MiwU0xoO3EuGHLEQaGiWCta7R/FuKOD81vz9Hdk@vger.kernel.org
X-Gm-Message-State: AFuF++lfqH4Ahbd/ZDLabMz4iQRk4GbyrzpLi7qtVp+CrBFDrSrfQMCY
	UmXSQrixPZwUM0IaMJXlLXi7zk+ioissuZeJaQtU98qQx1XR6pZ1SA7WK9OdshJXCnR13AmAoU+
	6onS47G7uVgj4lbmsVI4zWFW8EMQ9AuIS8v4/TPC3uW45pgNynsSEkP6hAiXi1lNn
X-Gm-Gg: AYBFou3DYOcMTfsFJU6eeb9qSwr2fLiXQG2684ZhuCICepj3KgwqmyMSJ/09rjZDDbE
	wW44DJbnwk0LEz2+PU8ti+yVhRAI/kn7HTWZsK1fbs8fSgB3GZVkBF9nYWn2Amq1d3iu6oVRCwP
	ioKq6uu5rJvru8qGHxN+TKiR2dIryyOtniOr8Csa35tAWusknEfsFMuso9lpoXeSYlAzjGNyOTB
	BoyM+nsNkdX2ED+pnwRI7sJxBQSE2Zimd5krW4cuVnSkE0YhjbvMEvulHWxL1SOLTwbJYoMY7jb
	dxb9DHZkmoW81/LXTWwv4HZk28bk1hD0oSt23jqtTv15/qwTMAF5rGiwkbP2jRA2K6bAHnKVHiS
	vBCpQML/sa3IMvK0=
X-Received: by 2002:a05:620a:1723:b0:93a:2eb:36e2 with SMTP id af79cd13be357-93a02eb398dmr392717285a.35.1789227408758;
        Sat, 12 Sep 2026 08:36:48 -0700 (PDT)
X-Received: by 2002:a05:620a:1723:b0:93a:2eb:36e2 with SMTP id af79cd13be357-93a02eb398dmr392712685a.35.1789227408211;
        Sat, 12 Sep 2026 08:36:48 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c2a419sm271583555e9.7.2026.09.12.08.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 08:36:47 -0700 (PDT)
Date: Sat, 12 Sep 2026 18:36:45 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 4/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra IQ2390S SoM platform
Message-ID: <tf5vpawigetrbqzhbnnosta2spfsuynfbngdxvvkh2tkdrpsup@bbh7sv52rc46>
References: <20260911-shikra_adc_support-v6-0-e4b2da5cd55c@oss.qualcomm.com>
 <20260911-shikra_adc_support-v6-4-e4b2da5cd55c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-shikra_adc_support-v6-4-e4b2da5cd55c@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDIyNiBTYWx0ZWRfX3mQsvUi5KAFs
 WAp+3OSj91aJS7xhdCmIjSoP/Wc9acXT/O0GRenGnpvWFrYzhUA0YPUNudLEB0FSRbRmz+AAyfX
 B2IR2TFkiaVI7mq7vlzYeTKO7VeEpRo=
X-Proofpoint-GUID: US2Pm-YdYvj5IFgvz_IN1L8K0v5OFLJc
X-Authority-Analysis: v=2.4 cv=BdZNQbt2 c=1 sm=1 tr=0 ts=6aa57191 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=RXrNB5dDG2c-zWUEkKQA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: US2Pm-YdYvj5IFgvz_IN1L8K0v5OFLJc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDIyNiBTYWx0ZWRfX93VFauKFN/4D
 ZO6MYW5dxGAoXiJoI+m9G8NaX4t5hE1Na1CvtWeCGqcL8XzLqVIMUZ5C5yTHFB0fKHjGWKDYN6H
 rwKZJ9QOnNodAvt8ffiqfFcsGmS16Pfa6RAGHzTOfPsSt4N4ZlI+rRFk0Gcga1cvIVYAlXBHgNC
 W5HfhJojXAuXTRHmylP9IwBis4iSBGwz+uNRNrK9nX5+b+41Mb3NKHHYpohFuLu8+sHPRK17h+J
 okvk0aHH4DNfJbPCe7gjEuo4XStwS6fmENSAhTBVRyPIBJIcF4J7/nnREALURODBQpiey8aA05i
 3orL7DTR+xL5ZCx4ZsFTelKlpwhx3wvQDNxvYMqw4r9zpihq7iYhZsAp5TOJz/BwlJpb7WS10nz
 KXn+MmwJfysqKkJYYxBjgRKzaYJchepzvR9rrX2zPv/hwbYNooQApGWKhqKzq/rfyAd/OoTpZ0m
 y+DSLIG4WfwSRw7j7dQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120226

On 26-09-11 22:10:42, Jishnu Prakash wrote:
> Add ADC channels for system thermistors, used for thermal mitigation.
> Add ADC_TM nodes for pa/quiet/msm thermistors and also thermal zones
> for them.
> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
