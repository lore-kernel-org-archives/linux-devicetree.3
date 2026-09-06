Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7981A31355B
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 13:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788699846; cv=none; b=N5fU3opE4tRpy00rNKKeJcY2wgdp7t/xmhr5aUSLv8B9EhwpimSxBG/P08x9Rh2KtIp/EM5nLX1oNygWt1ln9oRm/GPii4O3OvWrxIE5zLoJxPvOcPGMLKcuHCC26nZxU6AI+FIPaDWKmi55m9X2AnfGeEXFWlqUrivFWeTme0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788699846; c=relaxed/simple;
	bh=QjW6DhwnX9n+G3RTO3v8j0+GcYFZ9juol3cYQRMGnGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iIAlqoeaqfY2vbpnCSFLq5K3G0NqT2iCpXPJMN9OtpiotRV5KbHM/aGDh1o+uLU5LFkTeNEgrZCAixydk9LHEzT+wOee/0xLo1GvCDNfAewvcMdrjpo2gmdw3dvqFc44SHMKxR9V1P+qkBwxdrpekMWeVFLg13D3nMtxk59XZpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JyojFKwt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LABD1LQ2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JyojFKwt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LABD1LQ2"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6868YVSH3563352
	for <devicetree@vger.kernel.org>; Sun, 6 Sep 2026 13:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R2ysWDTJuB6llFpSgzIb+oRVd/8wf1+tQbxSGKnBlYo=; b=JyojFKwtf2ifnGD9
	rqNm9nNk553PPGh/DWczZPq9i1dXHl11Fa3JS9d46iDfFj4UCTqWWb3vN40k9rOS
	EopsvEIDaS2A5Atg1ooeu0sQo8Chp6a3toS93qRXad+6uZkZa0AzTkSTyQbh1jl3
	2NMQR3W6rl9dLKq5JX3ZzjJT74fJ9RwNotrS7kaSFZqOix62CjC+urMDtuGWyes2
	RhPObL4xyDmTAVStl6YJeOFFa2ePJldo1EljxnRDJUxHcKi7GVNlh3P/ZGPXcuiA
	WR7khhR+7HQVFNjFDzWqD3jKwa7kO0P3oBOht2iNS5AIaB61MbNvGalb4PeUQIep
	fKzgMQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggc8jbcye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 13:04:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6f80c76e6so50159555ad.3
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 06:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788699844; x=1789304644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R2ysWDTJuB6llFpSgzIb+oRVd/8wf1+tQbxSGKnBlYo=;
        b=LABD1LQ29kzBTN4Xy3jFhzc5wQo1idpBuR+ReI1Ukwkj+wUW/YLWqfVd0o5teeeP7E
         /YwJNFRNN+tkrDkLW5Y5ZVXauED20BALoXaw8e2UcuaeUX26AQGkpSKIpp1RcvGwx485
         1YfzPjWZFVSfOKn9hmKUpdio52qiZsMIMwHfBY4WKv4JzSot0tInzeKIInburWtq9Zxz
         KpeHloKQ0NKdOEX1e2SRpoShAS+SibsILVOob4BliuU7RJSUc0jD2l0BvlBLKGSBuzs7
         o4EIID8Pq1TXTaOYVpoPygoU9i6u0w7lrjfs9uJyypATQLTxc9CzhtRlbS8AfJSQKHH7
         6yPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788699844; x=1789304644;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R2ysWDTJuB6llFpSgzIb+oRVd/8wf1+tQbxSGKnBlYo=;
        b=Zm/bZ3V7aTX6swErTNUGNtcuqaE9J/4oVU0sT3egIYTLaHtYMIzq29LoAn62fyIEib
         rqY767d6BcLg2kPdMLZpHa5+pK5UCNgqoW/Tdmz6P0AgoUXgx4pAmHG0PKCHFGcTa+YS
         kW7Jj/Hz0O6fozL1s/2oEnbMeMmkxmgftZY4avV3uiDyMIdjc72KYocd0hRTKdC6RoLN
         zurM2HMOp5sUAarSrkk5NmdL5KC6WQqC91GqIsr5THHt6LgSPTrvDrEMWlhTsGLAeT7d
         96NaOlUaVpr4VABEX5D6zl1DcLtaueSbBZ7pKkmDw1yrQpswjXGup1c0GJ65QZc7+EDx
         GknQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyXLlkQEvYL8mjj5ULoErN1jMfZ732se40iCj62AaJOlPPujz7HaQ3Lww5clHes5Sl/AFjrAMYwRq2@vger.kernel.org
X-Gm-Message-State: AFuF++l5SZW2uGMod4lK/b+pEvyrx+bCgXcd1WD1ynCvDxNZHwic5v3s
	0OvpAMGMz02Neti6EUmso1FyzAqBZ5sQi7mJUeB+HFGX7uEHnS3D5hWprPbycDIOeZNy/Rw1ywt
	dkQTsdklo8/L0JSAnMYZVgutgUcI+jjp6OopcP1WROdP+qWrk0HpXFBOfB7NvpNLU
X-Gm-Gg: AYBFou2RdoXcIYMSFr+Kd7z2n/Sdez49RuAeuBgezNEJr0zBUVPtp+sQcnsa/dUuokg
	EkF65l1JH0PJc3A725zDN3MQci3fFN/WFNwl7tZT9ir5TLQ2TM7KhU5GkO5XjUmOdjG9ajzKI1R
	+pch3eUtlgka9slH9GQLBXpAwO0H08d75c0RlJ5Y8SzvL+8B/m6eB0ZGQoBlemDEbwgTJ70EqAX
	xYv79RxFj8oMk/lCO2JoVqCCHWPmpwyWagG+3s+r9eNr44iv4aIgHFKFRfmjPDJbDT0jAoIodi0
	xTWvryNw066WBUKOPtWCNr/EF7Usw72Be1SxEH5nTWh2JGfbLg3lA/pmW1poGyI1f4eaDDbiAJi
	nUNIHntWrJC7vnI50swtBWoO1Vaew
X-Received: by 2002:a17:902:c403:b0:2db:2c09:98ad with SMTP id d9443c01a7336-2db2c099a0fmr129398895ad.12.1788699844052;
        Sun, 06 Sep 2026 06:04:04 -0700 (PDT)
X-Received: by 2002:a17:902:c403:b0:2db:2c09:98ad with SMTP id d9443c01a7336-2db2c099a0fmr129398165ad.12.1788699843535;
        Sun, 06 Sep 2026 06:04:03 -0700 (PDT)
Received: from [192.168.1.11] ([103.211.19.41])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33688cfc714sm4104133eec.20.2026.09.06.06.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 06:04:03 -0700 (PDT)
Message-ID: <03368f56-5542-4c02-a4a0-f57d5cfa5766@oss.qualcomm.com>
Date: Sun, 6 Sep 2026 18:33:52 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 5/5] media: qcom: camss: Use data-lanes starting at 1
 for new CSIPHY mode
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Felipe Balbi <balbi@ti.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-0-f7bd68b5369f@linaro.org>
 <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-5-f7bd68b5369f@linaro.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-5-f7bd68b5369f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: upcQzcjERqFlfF18kmtCu-F4FH-Sc45u
X-Proofpoint-ORIG-GUID: upcQzcjERqFlfF18kmtCu-F4FH-Sc45u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDE0NCBTYWx0ZWRfX+avpO3teMJk3
 LjCi5mwNXlFVdJWnpesG9FROLL0KwTFPu1W4JN1Ua3ZBf/MBgXmWKxMWYUN57APylkHwYUV3VfB
 hOTKRXHNrQCE0qkTkh3bAcaT2XMI8rkpHFleUlkIt9EynZsCIFtgR+JukI0nazhS8lYMrwzAJeG
 9pqiUnJhIdzW8TM4gvuSnAV9U+1BwAGuiP6/66ZYRpriq53cWeYZQkifKK+y3r+bAIn2L6xLBVL
 aWviluC24Sx3BuSOIJ9K/Ip5GPlIzr8NW5Id/E3qDDtYefJhmFdi3XScLpJ5iu849nI7kf0v+LX
 EbKaUjghzIh1Nd7oiyc0cwhHN944eFJPJxtqPg9FQV8uuEoKvjfP9zHJW79Ma1fCCVXBLUCf6sH
 Tq+7SXSKqjxQJGZemRx404QDsalhHY/se/tFqyTiThi7kFwn4qGAu3BgcwLoDKCahh/TMZ0psqC
 ystrB4q8ob9YFVH6ttQ==
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a9d64c4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=HcLy/BXbbKFjgnJyaMb84Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=uHPnOIaY-gHs_qv2vRMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDE0NCBTYWx0ZWRfX2ZGHHDunrvHn
 VbkvWUvEdJ5tcju7IAlWlHkSFvyoaNzjP5M8b8AExy1aVBIDl8FZhcK7btbPovDu6o9KDnTYfTG
 noAobSr1KcxWFizve/W98pykE7z4N/0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_08,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609060144



On 06-09-2026 17:22, Bryan O'Donoghue wrote:
> +		if (lane < lane_base || lane - lane_base >= CSI2_MAX_DATA_LANES) {
> +			dev_err(dev, "invalid data-lane %u\n", lane);
> +			return -EINVAL;
  CC [M]  drivers/media/platform/qcom/camss/camss.o
../drivers/media/platform/qcom/camss/camss.c: In function ‘camss_parse_endpoint_node’:
../drivers/media/platform/qcom/camss/camss.c:4783:61: error: ‘CSI2_MAX_DATA_LANES’ undeclared (first use in this function)
 4783 |                 if (lane < lane_base || lane - lane_base >= CSI2_MAX_DATA_LANES) {
      |                                                             ^~~~~~~~~~~~~~~~~~~
../drivers/media/platform/qcom/camss/camss.c:4783:61: note: each undeclared identifier is reported only once for each function it appears in
make[8]: *** [../scripts/Makefile.build:290: drivers/media/platform/qcom/camss/camss.o] Error 1

CSI2_MAX_DATA_LANES is undeclared here, causing a build failure.

---
Regards,
Nihal Kumar Gupta
