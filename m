Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B833FBB6B
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 07:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421757; cv=none; b=D043kjtF9udK4aFQYFqZFxwit3QwNVlr2CqChQf1qGEKVYWKzQI0WT0YT0mBLRKsXiWxqEt7eUo8xRp/T6GqNZaoz0N5/pNdFLLIbZ7q9ep85ta/yAnBLRzRKJ4qnw4JSxBkB1gYuxFK67JTdd/FnI/PDKlf3lY4NTr6xVTi2hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421757; c=relaxed/simple;
	bh=AF8+smH/cjHnj6tf2C5BjdXBZT7dpf2B5g6nMZvyf9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jSZ3Hu4GOVqrrrjMRWeJp1cHMWzrMcQe99Aw92OoAZTv9cMUInK95pXSHAkvwEgC9rCuyJP23CUnjbK4mUV/x4B9O71+i5Of6OLjG6qGNUj5+B01jxLot7TbR0mpeR2ng5KB6n4HT0gksnvDvmS1J3jvviWoCz8XstGTtxP9gMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OHk8LVq7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IuVqFA6/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OHk8LVq7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IuVqFA6/"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lVPs3749562
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 07:49:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u87adjPXd/a9/pDAb++PYN7u
	/khN2/IMaGJs1A8fWPM=; b=OHk8LVq7Awz8FhAOG1z60y4iTf9ol7w4CkY9WX62
	Bt9le1Gr82F2RJETbjvOA5kBladvzUry58tClXUzNrAtFq9IZAfdd1RBnPna/xnQ
	B4BEMo2SLCql1apwzWgt7HBmI2ZpzsCyOpD0oCV8lb2FgBvE0ewEtI+DLH60jGzt
	eTpDhAAE3OLu8NsQpEA5kpwc+MGqcBExZW4Rd6aWBfwsMs+4NOYWuBt4ila+yL64
	B7a49qt40T+CvLOdKDjMro+2f9oq9iSiWC6tXkJjGjouPYBCQz6u+scdSan9uAVM
	WPR4e/U27l1yyzPQVFm66rYO+nqqwQNsixMau/+zB+aVzw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gepv5ugyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 07:49:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9390a2c895bso545637485a.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 00:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788421753; x=1789026553; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u87adjPXd/a9/pDAb++PYN7u/khN2/IMaGJs1A8fWPM=;
        b=IuVqFA6/fNQUAVliSq7Orup4Nl5fJZjUIjCU7FxUnk4arC3CteY5lEG+T6SCdq4x4P
         7CpnUZKiA0+9eJj6U5evTsb9JpL4pZEO3M9m81P/IAPtfxBpzWs47ZkDar9aYcg2UNcq
         /8WqRjdiUpmAaVg0PG57/qECd/TTkqlv3PrAfrbRxNLCTmXDrY7uQ9t31UTuDU/ETv4Z
         VW7WewlQQJwx62zmVZt8obC5kvTf/55GbtmVGUwObiWeNIBgew4JgHyN9wCSRSn5tfzP
         k+S2eJQyaJN/j4yi+g2kH09bXEcL8xUDmPZm+i917/sMn3FBySghKTST+y6+ZsSuGRC9
         pi2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788421753; x=1789026553;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u87adjPXd/a9/pDAb++PYN7u/khN2/IMaGJs1A8fWPM=;
        b=r7SsjxqYWbOTpaZV63LedWP1bcsvt1Y+yqFL15VYwsWsE08USG6PX8uiKUcf3hU5c2
         cF+ZDsTvONCSh2orc/ThmoECvIU2WjkJK8/U2IqZOPso71KsrcshN4O3joc7KT8cSMgQ
         vZoIvVK3YQ1uxOqVWAQorex2QeHdqTx/epLPxEgUOGdfoAISWhcZVTPAAfw/FD24xRGD
         kbBs7NLTe9H0htjrmjx5YtYXep5SNmmvwXuaXPBQ+cjFk6yQuWA6PlsHYstoDjxZzYjG
         PtuuPvZrm6hq93e3oonkTpitjM0fmuEV0dzJAviVjLfOLNBIsN7n5qQJw3kbhNmXYNA3
         3eQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEgOv6ffQANKIigLXNglAT0QK2QzfC6VmWYKfixY9smiICZcVoupVIqxzl83qV7ozE8uLcfT8jiXot@vger.kernel.org
X-Gm-Message-State: AFuF++kPh77D/HQ9Q5ZNV0e+u5ziK/MAAq4iyd/EfO5m22bkY8mL3ORK
	TqpFdvKcYUhOfcWEDRifLLMPNnhd+ekABegAHUMQevDjQrdStQPNOcZtIUifDxzn5iR/NPMnDpl
	IjSokzaDqSoKAbXX2267sTvE1PLgRKG6kk1omtSiidNVSQtiblFNEsSzmli42xFpB
X-Gm-Gg: AYBFou08BDMJsERq0JAVH/av838apKtPsanzcV9NMvP1KLTjvuJDXfpRQy0H8wD3Qi2
	3OQb1Ygv/DYNn1FcL1ecio5LpBWWEQk2F9Al59RSVwv98TgIKePP1GjugjQ7KrtObkT/UCDL4ed
	2UUgnwPcRvbbIbwbuuHVMMeW2xgktOKZvFcZR96nO7Uue9KkpL3Qxn6Q6FL2ydR8694VNd32yWB
	ueSYXRRx2IRwhWPEM5UFSUbiIDvfoolZD3P6RcLnh9coBNJyoJHqC4QC6vncHPy7njeBpPUoa+f
	VC9s7F8yy/KiadqPZVEGmbcvPbLuAkg4H+0cbJ9KDIIus49Qdxs2LTFhhaAJADJ0hhtRzd3o6gI
	IpIDJ9sKpoIF76Q==
X-Received: by 2002:a05:620a:6911:b0:92e:51ee:7944 with SMTP id af79cd13be357-93960f86b8cmr793490185a.34.1788421753171;
        Thu, 03 Sep 2026 00:49:13 -0700 (PDT)
X-Received: by 2002:a05:620a:6911:b0:92e:51ee:7944 with SMTP id af79cd13be357-93960f86b8cmr793483885a.34.1788421751664;
        Thu, 03 Sep 2026 00:49:11 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5533ffbsm81003595e9.3.2026.09.03.00.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:49:10 -0700 (PDT)
Date: Thu, 3 Sep 2026 10:49:08 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: shikra: enable ST33 TPM
Message-ID: <4gq3i4fldybx67ac6vg25kwddrc3f6uzp44pkdlnik32wg6c2j@j75ifdkrsd7j>
References: <20260903-shikra-dtpm-v5-0-e8ea3ac8a135@oss.qualcomm.com>
 <20260903-shikra-dtpm-v5-2-e8ea3ac8a135@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-shikra-dtpm-v5-2-e8ea3ac8a135@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a992679 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=yLgYBEAqgqfNvTdY-4EA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: tJHFkj1lua4ugJ4GaB2dcWZzfPepTkwZ
X-Proofpoint-ORIG-GUID: tJHFkj1lua4ugJ4GaB2dcWZzfPepTkwZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2OCBTYWx0ZWRfX6oEyaWY5MWAB
 +LUfkpZfz3bwUqhzz/5KfQ2ZEWFQYRldXMBR2lCYNM6zzmWDxYAsNb4Wa7eP7mOsyY5QxWwa562
 yDy3r1U96bgX9FaD2AWbdN8dwFQCvyu+60tvjm9ghp54k6uur0vAqwZK0LlmqHt7Kg9DzRbo18I
 UWwQE/aoRuBZFNb7u8X742WgIhBdHB58WBDUEVCcQQamRZ611qLBWsX14YXolbws5c5mr6Fl78P
 oXOONDJn6UjIP5pbE+nCIfcUSwyD31Px8w6aP0CiIq/5VK3YIX3jsMZVoGVyqIjS+exH07A49kt
 NJbg2nSTbR2EcUkNa978e/ZvrIfZDOBSPta28DU3CIZIXzHYolMMbm6XKrhfj/iotCrSpzD9138
 H+mPFLIJFAIp2gzojzckPqr5IoZbMnMZq1JPQGBx692X2baJ+AXR1UUjd9vsprD4pY4YzfX9n9Y
 eqeVHK0ClF4nVeuZ81A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2OCBTYWx0ZWRfXyaZ2MX8b0YHI
 Jca6IyyJO8nBAF4b1fvYAT6XZpuh1JgdQBF6IndZSedd8VXgHk6z4K6HqoCqK4K7wMASgnH1y7B
 L2Yk3aFTsZ9EPpTz4S7K+isFKQEBaDU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030068

On 26-09-03 12:48:54, Khalid Faisal Ansari wrote:
> Enable ST33HTPM TPM over SPI5 on the Shikra IoT EVK by adding the
> required SPI and TPM nodes.
> 
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
