Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A682C234A
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 11:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782128232; cv=none; b=gX/qWKx6Y/aHXRP350UnM94i5C9kJSayBg/JpJuJ+rs2I8nOcbpDfWS8nxZiP4FV1AGNHVhvTRnPhjuLy+GQkeun/zkXZu1e//GOVVbKp1/sXyuSBopapmsAbfOGH+lr+t9bvbpEVG5rUxenj34uWECFN3UUWsAvjdEegbi/cE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782128232; c=relaxed/simple;
	bh=AZgc2b1F2/u6RSI6QEKCgbFDh6USJtktFy94PBtnXL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cZ9ICtGvnzYN2imvnzoOQ2vE94TPLvCXvLLf4NE2rJws1w6wPRA4NknAuLsjSg6gxmqJclucxqbLaKo1givD7wAsyWgu4BcmFwOF8lDv3VvKk+95wXxiO51XT1pST1Amu7jZJGudu9ggZZ64kn7OMipNfvXexnffhCpqlr0/p1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XNpetfc4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bUb5HNfj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XNpetfc4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bUb5HNfj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MAoHj9941162
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 11:37:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ssvR4vEpREl1pYHrgYMEDZtfjBW6oxYrmJvvewMEy0k=; b=XNpetfc4bchl+Bo6
	b8ZpG2c1yy4zneBUentp+i3VHfAv00IjnfKZS3lB/1KJpQ0EsM3pP8Bhlqx48CAG
	p5+cbX+UrzOuh6i6figo3M6vkZpWXoGwyKHM4wukaXMtx5NvijZegmVU0YNW544e
	eDCy6ouVQnfY0i93yKsl6M7PS/rbiRoVVJEJpvH0HVuF0NkSEisWkIVd+hW/sQw0
	P+apwlV2fNJLRatNttQPZamAAzhetHCBBKcJID4uvIPPqMgUaEm7BMfDfFV+Hcxb
	trBM7w9YbfkR4bTdqcE3Jjij5xY6mcj9J2xsVbzlWaEnYYyRJkS2mFqZoWMR5XYf
	0EwhAw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3eb8685-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 11:37:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5178ded346eso4004651cf.1
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 04:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782128230; x=1782733030; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ssvR4vEpREl1pYHrgYMEDZtfjBW6oxYrmJvvewMEy0k=;
        b=bUb5HNfjr019HyEVaXfJM1bWmFjPc2Q1ZGjn5QGtXgo2VRKi/WP67YD3dtuHi4uusl
         evbJC3KAAmV524U+Ic7YdEQN3hISOOc8mgtdsbYOanxnGSTWF5yukgyiTrEvfHPwsz/U
         OADlCG3z2r65ZvfywPqzomBWTz9Gu2YYgkEFewQYian4bGEWzgDxp5xc2iqJpNLHcXO4
         pgWJCs9UOSJSGXzCdNWfxkICJGte4aVvYocCcN1bS1jvvwcEQANbVdkElN77Rc60JHRE
         8UkOm2OCVFMvJQzdMM2294jOfGvxJ2NVkNVanp0HCog6PxayhQ4JYFwqyfA9puh8caKt
         i7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782128230; x=1782733030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ssvR4vEpREl1pYHrgYMEDZtfjBW6oxYrmJvvewMEy0k=;
        b=BTxyZ3KN/pEQAl4gsl3xzIZxJrk+wh2XMl+Cjbv3pWA/npVem8kQhfJpiYVyw0nDeY
         m18Eoway7EsxoT6by/ZbQfLISoLF+zpdLGRNFmjUD0ioovfhg/0uJuNITbzjIoJ+VzvO
         bvyvlhLvRT8ddgW01ZQdp1DLhiBxLKq+2+K+ZSZ/f8C4/B05xLonSU4us71i+geMdlC3
         Nc9xx2u5LJgdyY24HjFRYij0KRhAtynbgk9Fe4ataJW0LOpeJCm9qf565tqFMprgJjuA
         yq60ZVLV1Vl2alU4i9Vkj8iDkAyO9YOtMln+gs5uOs5n4MaqgkdXhNpWel6ayTx12RCI
         hB3w==
X-Forwarded-Encrypted: i=1; AFNElJ9nFQ/ZaYp1vMA7k6d8steR0KEOi4YPuysRPd9dVuMqbPVu34SS7Yox7e/7xogUxkXo6ZKFRW8BiWW+@vger.kernel.org
X-Gm-Message-State: AOJu0YzT7wrmjNeSlIjpy+D5j5wmO9168402OPpZ2IeDj4boN6fyGBcF
	/z91YYA1G/DlADCnoLUCh3J8LWo3IVRmedRsK+uQCJksOB2Vt64fL77kT/xDpjJlx0wUdlS4i0F
	5aTdno63wIiwOwadaG//JCIYt9Opvyom3epd7vZjnBpOsYiVUZ1OJ+0Q73tPDIfw9rUu7/fAQ
X-Gm-Gg: AfdE7ck7YLDVncgeXwsV56FmGNMZn4xM46TY4+KEOictzcJyEWrir14JueYYvXiwzZq
	JJr086s1S/5yt6pMCr7UDnokqVXKrqweCCFSm5NaJ6VMAKzGnUtUi5WyBpVu227vN3IVEQvsCMF
	vpMfK0qnoRIvcDuKgEnugPBpAJn45bu4ls0EsQJKsTG21EKCF6epXMgfPhAzyxAeaI5uJrWBcu1
	GzwAd7LP+snM6GvDU2O0Tnyq0lUpAKaHdUIN75rrSTVcGoGt6jQ/GFX3GCXAkHYOxIpy7bCiO7y
	vkDZqZYM6XsHXtz20H09DHtrmK86sqYO5Wx5lFc5hHuDZd+yA4JHB7MoukqAtS1b2twsZo0GNTo
	v7aO5o7n2RhzKzpLHsbMUJ21zDjNoRLD0XJw=
X-Received: by 2002:ac8:7d49:0:b0:50e:487a:bfef with SMTP id d75a77b69052e-51a4f417a57mr1324011cf.2.1782128229753;
        Mon, 22 Jun 2026 04:37:09 -0700 (PDT)
X-Received: by 2002:ac8:7d49:0:b0:50e:487a:bfef with SMTP id d75a77b69052e-51a4f417a57mr1323791cf.2.1782128229323;
        Mon, 22 Jun 2026 04:37:09 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e99978asm339221166b.21.2026.06.22.04.37.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 04:37:08 -0700 (PDT)
Message-ID: <a9506482-aa46-40b9-830b-afc259f9e47e@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 13:37:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/8] arm64: dts: qcom: mahua: Switch pcie5_phy ref
 clock to RPMH_CXO_CLK
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-8-c939c22ded0c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260621-tcsr_qref_0622-v6-8-c939c22ded0c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDExNCBTYWx0ZWRfX+cKX9Hp4uoF8
 yP+jzHeI2a8MPR/PRNiQ0d3Y5ARn8rEN/mQOQrQCSajXADhqT5NcH+g8xmJoSpMvhep0AhINOUF
 WHV69ZTNg644rbY6J275FLily6XghSw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDExNCBTYWx0ZWRfX+uK1LETkCWPa
 2fivqc3y8IoCLiTJTKxQ1ujdSBXK+GXrDEDsXs7Quj7RiRMZCsrSDEIQamH2eZMzhNltmue8hHG
 uVU6YJ8M64qxoF4eCgCE7SGaOmpEx1cSRAi66m1/XgPXm5MOa6MKxR3UUVo11oyYs+EeBNtzBE4
 5r3Cdd053UBhiERx/plzVUia6+k4QfSkHoLIfocX5T3etzMEapUk7gtNkB0zBexZBujl643ZVrO
 h+Z4fDUe3wh1BFHCEGnzS4b1Vkz5wLCA/s1+m30Xo7ZOZqFrbD4GZucOcdrg17pacGyut+evwD0
 5iZoBp9ufVeBRUoG62InN1gRInI1x5Pvos76wkKEbE/0ldqCzKesoiwrQkYUVv58B3zPSFcNeFy
 xirNr0DSV50wt3ik5cJWnbh4xWIp2bYIKzkJfpVxikAT2cv1qtvfuwBNqnFG52syI46j+bf1kwJ
 2FuRkAQn27v6ksBDzVw==
X-Authority-Analysis: v=2.4 cv=ILIyzAvG c=1 sm=1 tr=0 ts=6a391e66 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=m8DMhdXBI9DFSf28WBgA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: dL9cn6Onni1VQ4Obsdj5d5ZHZ6tzwbBI
X-Proofpoint-ORIG-GUID: dL9cn6Onni1VQ4Obsdj5d5ZHZ6tzwbBI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220114

On 6/22/26 7:11 AM, Qiang Yu wrote:
> PCIe5 PHY on Mahua gets refclk from CXO0 pad directly, so no QREF
> clkref_en voting is required. Override the clock list to use RPMH_CXO_CLK
> directly instead.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

This must be squashed with patch 7, otherwise PCIe won't probe on
Mahua

Konrad
