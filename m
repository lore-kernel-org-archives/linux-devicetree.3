Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578150;
	b=d2Xv/Kah7y5+AwOCAx8zsjasfo+BxUKnuZMPHRxQdK0DB7Gt+L7vPyRA96LMpb/PrAQb
	 CXlW8H+lu3PwFbpAXowXVs3dFSAD0Y0hANOgkT1bstiAKkiGSx82XWYrDuNCuTcRI8sqB
	 zrEiSPfCwy+7AJLlQA5p/hDHflGGFdfI0Z2hKPP3K70ViY/6BMSJzOjUPP0T+h+ASKByr
	 uHrxc7nWl9g4/l18ak0+Diz4uEvBPC00qRXmJMg2NWxsylpnT56I7qt4CnRiCklreL4EV
	 yhRJ4tJjIFjx5QgkzPcqiq7GogD/+ognGzWUwamNfjmKIGMTrKzK9Wxrq9Bg626jP6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578150;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/5ptcCbI48PEs1dypq5dA9saJSf1Ds907jkJ02bp9Ow=;
	b=AQkpTW3yI8XFODc29hNOjO8G1eDtn4He8eHVisPP1wGQXBl0e2cpZFj/aPuTj5HrSVzr
	 Qxo7cBZfXNrAq6DBTtgnf0fOO2w+QNTJ5f7SiUAkaQ0h1FqKAK+ViIuGBzloRLJ5IuVje
	 2v0urgBjcvjY08dkjG9mtO8PI0Z1tOSWXMQS6thKclc76nvcaEZWK5iZ4HfwDP2cCSeMt
	 +++WiL/++giaGMyyCAJ6ypnIP4qrL+eIEaR7UzG6GiEN/jxXNJPBo0SDVGc+tubbgQlQ0
	 vpBeRXxQmAa7xkFJvIq1EPRVCcOIX/6SfFlJBfUXFdwS/djj0hs8BAbDdpu14f1LVeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OmIf+HU4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VRkh2tiB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84EE606A31B
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:22:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E84EE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OmIf+HU4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VRkh2tiB
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LAJTSA1422106
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:22:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/5ptcCbI48PEs1dypq5dA9saJSf1Ds907jkJ02bp9Ow=; b=OmIf+HU4uVLVDT6h
	D2e2dHwUZq9tStLrl+paYBG1CBR64UaBXthxFxFA/5Wi5i2sArXnP9vrEYSVFwJ/
	OJORzN4o1BrjlU3t1m0M4KS3jHqnPutnEEru8fv6tGuTojdA2oqzwUaiGLf2436T
	AU1HGF80OAFfhrAlfYBO9mBeDhjXIO8vAUjAeY87rfKpSmQmta0HrMxdij4D9yBh
	HR3lcbklyX9vbkpxZmDABxRET2shgUVgNLyUusmulHu7lIh4knmt7e4vf0JYL/FH
	ZHN9YmhfMA5dMw+/tTjpSfpqWe5hvvjgvrP0ddVtrhszwvgZnUQ5Qa62QcYbpvBm
	VhyMRw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heuhug0bk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:22:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-917a04d1cb2so1743916d6.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 03:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792578148; x=1793182948; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/5ptcCbI48PEs1dypq5dA9saJSf1Ds907jkJ02bp9Ow=;
        b=VRkh2tiB9/aGF2B8WfBgrE6k5nqNmIbuUYKKJLVipLf8BjhsEI36RFEkABFLx9DTCQ
         LUUqffAmNNhWlKoqQ2dbgCeAVjDB7viD3BeuJwiARGZc2NdjQ50vc9EXVFBTxQKg4kVP
         762nDYA8AbHX8x4Z4En9pYUJvuW5DXFAvrri33cOMtEFZabQL+Bdra4iLG0m/4PQp8s+
         DkISJTRZySsoHBMWNTY3wxJ/u0rnI8Eu6jL5PGBRBDz7GmKYUVpsWFTPkAOByFhtRGDi
         EReli3SAQS45yGnmd4wWoPw0E6n7HF2/cjHcYJKRbm6CPhNE7MQc/s30YRjyBhm9babM
         dODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792578148; x=1793182948;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/5ptcCbI48PEs1dypq5dA9saJSf1Ds907jkJ02bp9Ow=;
        b=VgJ/vClpOJqPaw6+sH3jflI30FKZ/pVAWB3KSvscLc4Ujcm2u/8Gn3Ixv7bP78Oma0
         e0fmbAUaOXhAlb1KEUudcCrhyaRV8pKTfY6rDp9/SoZR5VHhvjg6PxuA4UPNXF1iZUmJ
         kp2XKYOW1AOL1BKAwEnWVz8t4otaDYo9NnpmnmTWp+mrAb7dSMQ5DvqfMmAwmm4bGxfI
         CJbLrbt8ivUl5ODSMhWx+X0Zqit1/iGoGWIVQZAYElQpRhf+e9YKPSPofgvPeo2xplvM
         MjNrjBiNbEFo+C8MYFouFZCtQHSdo7PPzHc7SKBb4fIOQLd44kymBFC2tVfEOBUa/cLG
         FEXA==
X-Forwarded-Encrypted: i=1; AKwUvBy2Cx6rahR8/GG1Oo53l/Hrxu/eZQrP3z01sbC+OknjfN7m9vqLyJu14CUWdNvsPOK/hleTJ8Yz3XgP@vger.kernel.org
X-Gm-Message-State: AFq9FYLf7Om8e+bc5BFkMz1+CP0TMDobCS8K/zo8stciWn1+7y5OKGBq
	vxOQj3iLmtsy7EUx1swE63TMIyqi9sQnHCxSuRvKLNpVAyYQswL/3UBnYiePmqRKj9E4gjySU40
	RD6ugXwOQTIyJ9t2nDzOY+L9pHtu4qs8eDgCyfOWJcfVsIOxl//N/uelVu73QvZjy
X-Gm-Gg: AYBFou38iE9pl1wB46m/0A6Lv2GtVbYNE4JJJf08Spq0ciwssodBN/vH/7UOQuHG9lO
	JegDQIwP3ugNb+yXF53ZdrZFoox6n+h3V7T9u49XCXBcV5qknZdRNphHzlDXMCOFhXrAtHjtA9s
	uAe+MDZJbkGMEN0f//6MlYdtPEB91k/dTpFGY8ImZNMUxHGZjIqiLMHSTpy+7cdI47W7EWo6jRr
	Zgg2+cvUie3hExjBNB2HsMK2A+INenQ4QxaNoJyQ7WEBPaHuFiRs+tEq3IuxvV63zlfAx/Ji4Ew
	4tCe2De5H4t2ilcELQCYlsOL7yDvfrnfBhmnr8OWGrKcMBH/sFZ/i86JeTD5+fqdqw8rJ0cS4m+
	tcpTg7wRRv0cXJFw22QZ5zw==
X-Received: by 2002:a05:620a:6084:b0:939:8148:1e3d with SMTP id af79cd13be357-93f57eecdc6mr390504185a.2.1792578148068;
        Wed, 21 Oct 2026 03:22:28 -0700 (PDT)
X-Received: by 2002:a05:620a:6084:b0:939:8148:1e3d with SMTP id af79cd13be357-93f57eecdc6mr390501185a.2.1792578147680;
        Wed, 21 Oct 2026 03:22:27 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b403110386sm697576a12.15.2026.10.21.03.22.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:22:26 -0700 (PDT)
Message-ID: <b62ed7e7-a9de-4420-97df-5e4f73ccc768@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:22:25 +0200
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
Subject: Re: [PATCH v6] arm64: dts: qcom: sm8550: add Xiaomi Pad 6S Pro
 (sheng)
To: Tianyuan Jiang <code_0002@163.com>, krzk@kernel.org, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tianyuan Jiang <hiez832670@gmail.com>
References: <20260721142147.1618-1-code_0002@163.com>
 <20260721153444.423-1-code_0002@163.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260721153444.423-1-code_0002@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d4JgWhjE c=1 sm=1 tr=0 ts=6ad89265 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=Byx-y9mGAAAA:8 a=6LOTDsU12QUmseQb8m4A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX9L+Y5abn/9CT
 PqFhIGBe5XiO+7UK025VyAuC8SJ0C5YiZPkZzD6SRsqAzyZYo4kPPiPOUc5eBtknpNLO6ywFocM
 6NqoqXj8TzMQszMlyj8g20RgTuQAMhY=
X-Proofpoint-GUID: 4bOR3UwvECMHQKgZwYDK4C7KnkEYKPZo
X-Proofpoint-ORIG-GUID: 4bOR3UwvECMHQKgZwYDK4C7KnkEYKPZo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfXyCNYboGVr84M
 6zlOLF7ngcLzIMIu4W9fZnP4D54ur+ZKLV/oia2xgT8/e38DpssbQjcFQYzszkEp2AGD86OCVaQ
 hEk2n2xGtFEgGhS3c7ygJ9txekTR/G8kjGr6iPrS6Z3zU71clzk2p8PvnlPcm4r20lt/sn4JTYF
 FyMclEjczqrHbs/+KNu/3JAJ0TI6/Lyu/opCiaZNYBRuNbPsLJVEzbjBUgb5pgxNooRhcORKk7f
 pQ2PDg09HxZ3fK+fUMyX4B0S8XU60iqtaC8rXISPxG79GdlkOo6B0UqPzfsx2YtQ7amRHC5wwig
 Of7TroRZLJamxBcgScJ3efpd5KFLNnzOH0Bv6O0RdogjtYbfVdSq1WIdQT/3ZRD64PQqd2BfnuA
 fJ/wtfafCzND1y9wybt0Q1p1Mj1ykL9HDPhnZwAaIR3/moNNiTYuZqJch1LNycLEQHnFCEwC7nO
 u46353zZxQTBUIyHbNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210040

On 7/21/26 5:34 PM, Tianyuan Jiang wrote:
> From: Tianyuan Jiang <hiez832670@gmail.com>
> 
> Add device tree for Xiaomi Pad 6S Pro (sheng) based on SM8550.
> 
> Signed-off-by: Tianyuan Jiang <code_0002@163.com>

[...]

> +		/* Required for libcamera to allocate buffers when cma is used. */
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			size = <0x0 0x30000000>;
> +			reusable;
> +			linux,cma-default;
> +		};

If you update libcamera and enable DMABUFS in the kernel, is
this still necessary?


> +&ipa {
> +	qcom,gsi-loader = "self";
> +	memory-region = <&ipa_fw_mem>;
> +	firmware-name = "qcom/sm8550/xiaomi-sheng/ipa_fws.mbn";
> +	status = "okay";

nit: please keep a \n before 'status' consistently, file-wide

[...]

> +	nanosic_mcu@4c {

Node names must not contain underscores

> +		compatible = "nanosic,wn8030-sheng";

This compatible is not documented and I see no references in your message

[...]

> +&spi4 {
> +	status = "okay";
> +
> +	touchscreen@0 {
> +		compatible = "novatek,NVT-ts-spi";

Likewise

[...]


> +&uart14 {
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "qcom,wcn7850-bt";
> +
> +		local-bd-address = [ 00 00 00 00 00 00 ];

I assume the bootloader doesn't update this, in which case I don't
think there's a good reason to keep this property here

Konrad
