Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE15B3BFE2D
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 14:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782743059; cv=none; b=bFU2PCQslxKkN3t5VE8i2jGSJF0LMvqrdK+Kyhx9tj3AiXExfJ25/DseL231l4RFf8cYs+9ZT0aEzkQ9PeH9S7d4FcG8lyUih53Uc9TT1NKveXUJK3WXP0nelL0Oe3MisDBl9T3J/XnrXcWMhJn+qJhim1ae2XSIxMWHFh7sYsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782743059; c=relaxed/simple;
	bh=QhjYhjgD+R4jitEU00MSdHpAb1AwqBK0hkMTcNKdHTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=It0qiQdz0lCmSDsHc07WJqefQdL1hrfOO7KG4YFNFrFpI474VPnja01z1ByrxhxvNCbc/CUro56bqas4A6JnPny+/30MCL5RJHa+D+2AmFDtWdLMz8dlWjMzKVDSDw2TQN+iuCVX1rDgk73Xi16cvJtdK4YGBuQ2I0y+l7+9sH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V78WYW6H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TcMuiCKG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V78WYW6H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TcMuiCKG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASxjg2641491
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 14:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TRK2ZjVCU6McW4zLkThd6mMc2zayM66nXbOTiq+zr/s=; b=V78WYW6HJuxwSnnO
	YlctayNajH7/IUHvr6SyeFkPGU8IAZFuHlusrOnBK3u7Yvf+J3zct/sVBKaj8jtE
	c9xb288TbtF4AQ9bmQrso71reXN/UOPp8CykDHX/+BQONHSlUEF9YNk5h/XA25Ul
	MokFbam6GmpX2nsD6l+5X1yPU8+kaIc5HGgepzsjiRnlDkOkuPyKxTqETA2XuJIS
	sv+8GlD8Bpl9Vx/cvLNqYOlT2yd4cgknNbxlnlQzPtc1wGfkga7K2GuIr+vaKVrg
	d/FNm9Jd5YmVb7+nmmpK2Grf7M96e8XSRTS+b63G4d2FwWdBcDdH6i9Bo+cY/hDF
	H16KXQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3npes88s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 14:24:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c07313be5so519451cf.2
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782743057; x=1783347857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TRK2ZjVCU6McW4zLkThd6mMc2zayM66nXbOTiq+zr/s=;
        b=TcMuiCKGwl3GHfna2HonLIysyqlge3r9txsLhx6tJaduxfsAgfgtEIsIAEWkDeXSEf
         IMRiBHDSL2whPxW52RXtEnprfWZ83qwHw21hXNtMqPh7vTRHy9D9QctIr68I0LAsZsHe
         61iXa5Yf1gZwJCD0xpwSdwy8p3xEaD8c4RtKqnyXqW5fbz6kBywpGO/wX/s5IRhe8nGg
         7Xrfs3rs/z44xAj/MyJkHBcQOXzqtDp60oi8n5JMMtu/Lh5VkSCVHXiyRvVlRjHFKP3x
         st8TEwMs3NgtPOJyqQQH7pjyp0pGymOsBymS/Dg26TAe5E0//sfhtQUTzU9nVu/qZo39
         X0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782743057; x=1783347857;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TRK2ZjVCU6McW4zLkThd6mMc2zayM66nXbOTiq+zr/s=;
        b=E4WsWbfMc11PPZrsrQnzuGOcMqCstLNtLjRyZIuXaceXNXI2aLo3dgrtgblETGHxd6
         2aFusfNJFKssmNMY9dIdEWl0SIo9HdnmcTYHTvEUzazGoDSD1h/Lm9tWXQGHRdD31aR1
         +0a4VcYQRwQAMZbks/2vNqEJVL4v5xM0TxnKkvprjP8f/6osbBNgVzLb0YwCqYzxIvQT
         k53QTbc1o4nHHxnnyE0hbSWkmDgVsHDTA0ujYilwwuyJujpu40tYcdv0MGJXIkBUXWkh
         QOgk42z/vZGP6Shk9wH/bci9lNDaVpkDzskG+FWxaj81uWkiuZdpj0dY4dVL/cHzSlCh
         A/8g==
X-Forwarded-Encrypted: i=1; AFNElJ+gMZkz1lWILmuYAeC1Kswuzw+4BuX7mdxVMgr2Aprto/cgRoVrQFKLv1ODp9QKKZ03Qn8fVmEfdEIA@vger.kernel.org
X-Gm-Message-State: AOJu0YzEAIGw1HxoywseVWeOOQRHQWh/dYo310Q+NwEI7Tq/AJKBamBA
	ws5M1PzxjqMqEf0zgtM42tIHmpZOXu6o4EFiF+Nk14TDQOaPmvKY8SKK8c6eFdi5w3a+1qAHefI
	XHUdjcDrxBiu48a1CnrNB9RnM1vbBwLtKvalR7yfamXzJdNWgSP/fS/TTT+MdsLA0
X-Gm-Gg: AfdE7cnnJXqSSIKorYi+I56Lzc92Irph0KrhATHPazhebXYxErlKNZvYLTtebkAACoh
	v6tBP0PRUsQ9uStSbrHB5yA0oohjofEOA+XTLtz2PqPBnfFOXDpTx+S3o0FNgBsIGapSQo4smg2
	wsdZ35zFUgmu3R8bxUYuot6DwxgrYu6Uf1Z+/I0JjVDyVd0aySYOahKggopQNxBIhfVcnqu0NcM
	4MnVxkcU0RNMbs4Xo+2Io5XNeBv1dJkdeC1wE1Kcmr7XqN/9OuYod5paep3ro9W6nVWoYgHuzKl
	KNeDNEOf87TeyrZCDalVkILANE7IpPNxftze2EwPiVjWdvI5xNt0WTB0rUUPD7eFaMK0rJVAxCe
	Vk7Q/9NyDEuFzisGJRI5LNRkrBpQFStDyYa0=
X-Received: by 2002:a05:622a:11c6:b0:51c:d8f:d77a with SMTP id d75a77b69052e-51c0d8fe47amr6120781cf.1.1782743057026;
        Mon, 29 Jun 2026 07:24:17 -0700 (PDT)
X-Received: by 2002:a05:622a:11c6:b0:51c:d8f:d77a with SMTP id d75a77b69052e-51c0d8fe47amr6120491cf.1.1782743056584;
        Mon, 29 Jun 2026 07:24:16 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c127b7619afsm80746966b.4.2026.06.29.07.24.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:24:15 -0700 (PDT)
Message-ID: <92735f0d-9672-4f99-8cb5-28dd78eeeb8e@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 16:24:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: add panel rails to
 simplefb
To: Sam Day <me@samcday.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260616-sdm845-oneplus-simplefb-regulators-v1-1-1db1804acef6@samcday.com>
 <c4a70b1e-ea48-49d2-afa6-639b73983729@oss.qualcomm.com>
 <pYvHBJyxrxgzDI2_h79hEn-wmgJbJpQ4z6Gy1doFhulVhtsOLeOyn5C-ZtxpPjNyv68za3FmQyxVF1KK7wRPF5SLGRK6gZC9s2QK8jgXhHQ=@samcday.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <pYvHBJyxrxgzDI2_h79hEn-wmgJbJpQ4z6Gy1doFhulVhtsOLeOyn5C-ZtxpPjNyv68za3FmQyxVF1KK7wRPF5SLGRK6gZC9s2QK8jgXhHQ=@samcday.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMCBTYWx0ZWRfX7BRz7suaoFFf
 mBdNTL1bkZbLIchmoCUKreKpgYt8/1lHBVUeXfqmM4WkhJVqbNEBHnrBQUJEfbLXNGAYi+wpDeZ
 68c2dj7Cny8djLwxtwTFbhX/E/tdBZj6Ssu5EWaJsCxB5Aiv1Vbyf0KZZ4ITyGwOcsJ7vBJ5Tg7
 FS/7fzZ0NyIJ9ZtVz93McYRuNYuNiJayLQnd56DSpV9OxccMQiwUnaUqkOdjDD5031yZ+NZQX8Q
 oLXZ3AwEIdbHOFSWQm6H3ADhIoEUJyTfQV2lu3AiTvc242scpiadSjqsoPRKXakZ/Mnb/DHMVYR
 ZvXj1+nnuqMDK3IDCwbwDDuF/jICkKBk5IOX5dgvHjzqZ6gMhfKT6y8J8mNP+sR4B+6qqdjattp
 zSTYrmOeG4a1uObOga0B5rdSNla+RvbRIW9TOQfL82zRZW57Fbw5I2XNdoDC+8r/x+c6k+grldp
 rdjpyqhMD2XgA4lg+VA==
X-Proofpoint-ORIG-GUID: SOYP5P6V5Mcvh0MOYUibRykXHT1NQTXP
X-Authority-Analysis: v=2.4 cv=T6q8ifKQ c=1 sm=1 tr=0 ts=6a428012 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=lKQ-AihTAAAA:8 a=-XagbMCoMRO7K0bwpTQA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=K6G5NyU7usMl-irPePdK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMCBTYWx0ZWRfXxgqYE31Rk3W8
 jjXhbEOStyTZEYVtStyd4Hp/KsPo1G0wg1KZug2Mb7h38MKyIoUnH2aT6a70hJoGp7YDpgfC/RA
 kgYRwEtJ6XKr2RYUCHgZNhfuGQx11tg=
X-Proofpoint-GUID: SOYP5P6V5Mcvh0MOYUibRykXHT1NQTXP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290120

On 6/20/26 1:15 AM, Sam Day wrote:
> Hello Konrad,
> 
> On Saturday, 20 June 2026 at 1:11 AM, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>> On 6/16/26 7:27 AM, Sam Day via B4 Relay wrote:
>>> From: Sam Day <me@samcday.com>
>>>
>>> These regulators are marked regulator-boot-on, but that doesn't
>>> guarantee they'll stay alive as long as the simplefb does. Adding the
>>> explicit supplies ensures that booting with MDSS disabled doesn't
>>> switch the panel off 30 seconds after boot.
>>
>> Why would you boot without MDSS if you want the panel to function?
> 
> For my particular use-case [1] I'm trying to avoid taking over the display
> hardware entirely, and use simplefb until kexecing into the real kernel. In
> this case the user might halt in a pre-boot menu UI for a while.
> 
> I can also imagine this being similarly useful for "recovery kernel" use-cases
> where again, it may not be desirable to assume control of MDSS/MDP/DSI blocks.
> 
> [1]: https://github.com/samcday/pocketboot

Can you handle this by adding a panel = <&display_panel> property
under simplefb, pointing to the display panel defined in the same
file?

Konrad
