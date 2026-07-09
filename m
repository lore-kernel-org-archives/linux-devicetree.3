Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BA93A2E28
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 18:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783621045; cv=none; b=LwQyW/zEojKGzIUkJwQxFwBZczaTUPrB7RsT6DWYEL76i3YuMjhW1TK/vPB2HfW83j63oid0+g03pFDf25hPj8ZWUzv7H66Htr86AHc9TMA4r9JNsmiOIXI79YTLRnZrZfc53mItWxQ9dA7l5YC1BfnfWKqx/t9Ihke8DR1w8dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783621045; c=relaxed/simple;
	bh=8jCrSeZHB1v8sGHQ98I0I2rMmqYVExTJMSbrKIT/U/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aB++aa4KpA6xNY86u7RQ93xnBQfGnSEvPhv6mHq2ujLj9eKIhZjlDHNFdqip00+UEXPCg8lUvuDgNvtq5xfFayCuaNv6Efb7nDMySV6pOq+ijo89LzSSZ3La+WwrEZ0gu+U8emYB66WlarWxjhErPdPjdf0nG7mwpbf7KCVFG6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aVU644Hr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hjEqnsFh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aVU644Hr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hjEqnsFh"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXp572423016
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 18:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nDO0ELt4xarDeNp50XpZhJxN+arGp/U3imA7JgKtXtI=; b=aVU644HrqqOoF4nF
	mP8RoEKHZkKEk7dN+pZMQXH3kgreOIqDge4xpwRBL3StEw2hMxfraILexrO8dWdX
	TKyUGOVSuTsLgOq9NPn8HquXo3IUzhIyNUs4IYISnHjMw/of4H9vA/DKnL0yq0Ts
	ZOR8oqFB3QNXyAAHGjry09k21oaMUgJsAjdMCSD0U6F2Ui+dcsU6oMExsoRd59QD
	P6yKHNvFM6TkXKSWNOTVMg7BrZaDn34u+Dnn4zvxKNyrSaEzz7ULShibIYOsH6pq
	yd6Tunz+/C1r3qavbB1y8AVylxzmtrYHT3QTpQXO7fXZtIFx7zy3mTu/gYPzSYK2
	opDteg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fadvj9132-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 18:17:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfa45b280so184551cf.3
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 11:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783621040; x=1784225840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nDO0ELt4xarDeNp50XpZhJxN+arGp/U3imA7JgKtXtI=;
        b=hjEqnsFhkSbus0cOs8krbNOeF0NHbagsSpehsj76PkwGKiR3t/pTT6BCFs/SYJNqi/
         qGU/2+BPaUxxqd2+H6ORMbks0UO2+l8/NdhunakyUpmnMCd223dmxLV/Kmkw8CWYDSkE
         Ew4JaF/pFZmz/VKlImU2J83e7J5U5jR4hrt4ri/moTwrUfQbBJZ1H4l8rpJ6DdCtQArr
         pc/ePWe57QDHTjKSzxy01mKWLTZxlgIS226xo04lTtewT2yLcJobT2tggaaX9N/RFv+y
         JQBh6sZ0wKpdRpcBcCZHP7lCMDG85uLS5UV4Zqtk5uNQENiwHRcMiL/tr9p32Y/ZVxKH
         T7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783621040; x=1784225840;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nDO0ELt4xarDeNp50XpZhJxN+arGp/U3imA7JgKtXtI=;
        b=rsKBsTV+a2QKaaQAHMrkDl/MIxJBky42gypuNdpJgznE39GGoLdXVgqGZ0X9mYENpW
         aFyFcAlDZ/j+eJziP8RfUMzzrnRXJIaJ9PZh3jeSemITbAnxMeibGp7h8h5SyBfoEhZp
         Kzxl2kCVfr/mWBpcE1torFOihpRPlJB4uzw9c+cbBsg479iOmRVts2pucVHiic0imcib
         mOJyUXELIA6G5HPvZk+8PPqy16BbJskndC1wiT/vzzGDR+l36pBJSjsr3pU4fdpGUNq/
         AxnEjaZCw/DSYxwGQ9486t4cv851lKbVeuVhYoB+iiPDTxhdsK4cgrOJFjvLq3IzKyp9
         62UQ==
X-Forwarded-Encrypted: i=1; AHgh+RonA42dDHFqa4lk3JnQgsfxbyH5K+OplVjRuyJRHukr9QIoPyCinPk+h3qvFSqH8O/vnGqc93QDqXHM@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6pNfwBfqQnd/IvHH/ZyNKFyoBkaGKaiN+qWL/BXP92Y01KZ49
	NksS/brs+0bGozBVmXdk7u7hgKlnYaKNthV8eqyakEXLl13atS6x8jUhKOd5dk8oAuQ5XLS7MJo
	EzwZV/EtUalKrAS33KlAFeu9cHimhcOEa0wlJF0XqY+lUTI61oCz/GyMzKbgAc5S0
X-Gm-Gg: AfdE7cnMwehoIFYlFwSqoW6NIpmLlccAuUhe784GCAhN+LqlXn7zxPihoxrum9h1RrU
	vyDoxMdscqaRkg2ANwwW1AZ5VaIZ6cILpkUdvF/+GA18o82gx7wfFnUIdeN/difzAofr9dogZ45
	usgm/5oN2ihMJvOkPAK+Ur08vwEu6sKBEO+5yYvQpu06qE6zAElK/XMRMI8DhIs6HEdnUlRxx+Q
	deSwKvxWBQQaJcWFqnIY50kqy3KencCCZBSHg3fSfGrCNrPiu11kLjCHA2tojACMb/vk15ChrJE
	aTNHYRAZKTpxZK4PsKzXTK/Xl88AL8HCNBCE13GVaInDT0xxmWwAh9Mazrjmqss75DiX0h7JZkJ
	uSmyVdRIufHtfe4ahjk+EkpMCuRYNiNgOqnM=
X-Received: by 2002:a05:622a:181d:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-51c8b2613abmr73375261cf.0.1783621040384;
        Thu, 09 Jul 2026 11:17:20 -0700 (PDT)
X-Received: by 2002:a05:622a:181d:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-51c8b2613abmr73374791cf.0.1783621039927;
        Thu, 09 Jul 2026 11:17:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15adb30f98sm550971966b.55.2026.07.09.11.17.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 11:17:19 -0700 (PDT)
Message-ID: <11796dd7-11c8-45e3-8f9e-1dc27da0b229@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 20:17:16 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] arm64: dts: qcom: ipq5018: add node required for
 Bluetooth support
To: george.moussalem@outlook.com, Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260709-ipq5018-bluetooth-v5-0-e476c41f03b8@outlook.com>
 <20260709-ipq5018-bluetooth-v5-5-e476c41f03b8@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260709-ipq5018-bluetooth-v5-5-e476c41f03b8@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE3OSBTYWx0ZWRfX12fTCL+sdOqW
 SE3OKl/1RLUxpRuItietQh5H65mig3Uf1wxaIMF9jOclhU+EtGyUfV6cl8mNjhReq8ggKh5TGsI
 WJ/bHDtftAklJ3DqkX8plNnHDTXBwNNKUrEBZ7nLB3BDaGmapSf74F40nz1cC5TZdHjj20OWlg5
 OkKhpAdyfXJ1fEG3rnbuNepA0cd1H3WQek7AqooKNowVBB/dhQgsTITuCF11AI1jF7WcyBEsg/M
 XA5J5LoFlDdbhSEI5HeWkZ0cg06Q+1629CnHWRCl6xJqtvticND9wKKKt0bnO3PIb1HXNHqqxVh
 zcNJTuDmptrD8f8+Ksn0aLd4lZ2GcNvXc9hQprRhsoQ0t24MzYLlhIr+L/APlBa71zVZffFqTod
 kZexwM5iewKNQaIhJiRJO4rDK2iTEbD9OO9c8bdKye0NEukeHVIjULZNsco0JYO2EoPhjT8iAxN
 B/XbE6xK6vaYLdlw0wg==
X-Authority-Analysis: v=2.4 cv=WpIb99fv c=1 sm=1 tr=0 ts=6a4fe5b2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=HNkros0ZRfBbVPr8Po0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: I-tF-q9jxeFs_WAAw70RvUkuFIvtl-Cr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE3OSBTYWx0ZWRfX6FxPCSYlfmvh
 zGmK5JjdgHpKeuwxjfDZHOC+pWY0L78OWqM6YEWeAGgnl0tDrhPLjqL1PbC7TtWYtN5qv+zvjGI
 PdPszS8q217XVADGbk0d3Guh2a3zmKM=
X-Proofpoint-ORIG-GUID: I-tF-q9jxeFs_WAAw70RvUkuFIvtl-Cr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090179

On 7/9/26 11:18 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add node to enable Bluetooth support on the IPQ5018 platform.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> index 6f8004a22a1f..8c252fa3ff5b 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -453,6 +453,22 @@ tcsr: syscon@1937000 {
>  			reg = <0x01937000 0x21000>;
>  		};
>  
> +		bluetooth: bluetooth@7000000 {
> +			compatible = "qcom,ipq5018-bt";
> +			reg = <0x07000000 0x58000>;
> +
> +			firmware-name = "qca/bt_fw_patch.mbn";

Hm, rethinking this, it must have ipq5018 somewhere in the name

Konrad
