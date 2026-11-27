Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795788727;
	b=lJ71Yt3EUcmzdcvre9JTwWv2SZASBNW9nBWA/qbcZo0NV9MoRQik6BeBlqlrYd0VBRBv
	 LmvpvH/LIct+hANZmBFUKeqNNau38022K3whGn36tU9/TidSCx/FP1LVrJE/VJtAWA3k0
	 eU0fK60RSEj0ux3CCRZr9PSWQkkSiyJWeB37Ff/mQY3LohFOnqWsk2Rk8xMlUS/q24/uo
	 9L78JqCFsRtOvJHqGNws1NrYn7OOw+6sFa2JBMab/q9liO/0kaWr7p5mXiIeKl+Q287ut
	 2O9V2Rskb7ubQ9CnyoheeAKwKhiR6KY5geUx7csTJKQJeplJKM8tMHoU9vCfzz3jEKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795788727;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lacAn18W0WPCl/RHsDlbmIAgP84IXiDEF8TBkwq5u8s=;
	b=J/0Oh0YNmuxADQ62zSSJ8NgHoApQZ7fjgqpb6N9LoqJw98xlczQEAOnv1DgOCb9vC1N1
	 zA+IHCV+9i5zbffqRIamzLVkF760RdIIevGxIedh08lH5huYRXNiMFX5c7CXF80HK11xX
	 Mc/bb4V54wsvToGQGwcbNkL9vkMALGtscYcF0rAoNXw1af2VJp6HT77v/UHDGvr/kH9uX
	 FWl5CckgHmZtYn1qkNxr6SCV+X95wycNihkvI54YpThfW88VlmPygX7BGCYrGEENhQtFm
	 X3sq6iLc6ERF2DMTDCMG0SzBqbLC8eu0hkp7eTBzZqZPcSBraB0Za0nKNyn0INCcHmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jJYtd2Ef;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="FWKwwD/j";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F23606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:12:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7F23606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jJYtd2Ef;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FWKwwD/j
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1O5q1462682
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lacAn18W0WPCl/RHsDlbmIAgP84IXiDEF8TBkwq5u8s=; b=jJYtd2Efx/TMqsM/
	44YSUe2TAlE+lM0Wn/MRJadaQkVGJ+rCu1ZE53uNPIoH+BBmGkD9we6/3bkQGY02
	Ctdy4SgJnz12dXnszVZivl6NdAlRlGLdpbojCZesdncurHhDyjEBfQqG4N0bEXO6
	r8Cj3x9P3ACmzlxMGzYFMMQlamzutk7AQ27zHzOPv6PZXBi0Id5uXmA4FZxuCQ+k
	YSNxKU2MWhXBQsilKx1mMPkeWdcFtT6tF7YdTZlYD4kuFPeffD7nnHcGp4O5zbGE
	Zsjir5L2bvslUuQxwS43fBMfnBsSKQNJ9jE73wSa1NJts5wRLmmAAtOR160Exvii
	R655Pw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqmabx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:12:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-945e8a244bfso86941685a.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 06:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795788725; x=1796393525; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lacAn18W0WPCl/RHsDlbmIAgP84IXiDEF8TBkwq5u8s=;
        b=FWKwwD/jJK969UN4Fo2CRCh1Q2YKYwoS7oF+Oa3OIt415/YNTQ3PvNwIaLGdqkyhwl
         UjowUc9iBOvfi18rRzxT/27aie2QSwZGLgJ17NuRwMdIzSJVu39XS2rql82Cu1a6GRh7
         WD8WNHsT1uYyc24DYYGZ2C4YVQu+9gkutY5VSaQgu16T/n5fGp3/Fry+L5xm0zMrfuaK
         IZ8aQNSWG63jQn8/9n42KXm++VzfbYeTGSWhdAoNXpqazGWxtMw67ofq/isTEROZBVNc
         ++1FTN6TRkdFVLhkR4UdEkjBXFzJGCirOlAkGIFeUqcJsNmz5YHB51RG/hCIXTKpvqVF
         eTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795788725; x=1796393525;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lacAn18W0WPCl/RHsDlbmIAgP84IXiDEF8TBkwq5u8s=;
        b=VyqNqE2kde76enIBfmd3E+ZnPGq64JAQosAOTVexJBb2O096oYoypiiFPDEfWyJw4G
         HFv4cupfebazAx1QqdOHEMEfhzQI5SQJZidHnseVW4x2WyA/ivKz4EJz0Dcf33w9NyCV
         1ByLDaJVYnWXyPy9BwhkohhCZNu2CQDyS9SymwnnD3GGHs0KTRJmjJroEc2seyYJVqHg
         +IT0y1XLLSSyH3d7oALfGmWtcucosyN8kEdFQ7sp4/635ySEZXnLm7ouKagJUbsz/+TM
         zm1Bk4yyz0m1+lVtSia9xxCCMUUQ09cYL367bhPz9E/lzztgWQetfGyjLDQ00vvgrqRq
         Z7TA==
X-Forwarded-Encrypted: i=1; AL+hErFXTea3iaIymXX7MLR0U6oaGqSEvlMeZalWNamAkOx8Njh6YjkV2T8QOist6nymdKLPjiwnGpnsK11u@vger.kernel.org
X-Gm-Message-State: APuU4Z+scfH/uV2hgNK008CH76HAoudQ+l6cEJ2xmd05IM/wK81ilZ9C
	2ZxEoYqOxd/40zm0Ji2edFYS6A6+pwAt6dPCJ5LMXRvebOyT9G4qs5lVnCoSRqHBCXsjR+gHflt
	ozMpZFcTrNIg6Ui9ZnC5gAiibXY0uMib9MeJ19tG7/r2DjLb20zH/ex1Ia411t/E2
X-Gm-Gg: AZFdTZdiCnBHF3VGES6EWTq9uOcYLEqrhitMcsdEqPJS4m8IldrCZaqXepnORWNYGKF
	NtkJv4KuPfcHlOCIygm+HmIXGlV7SPybnX6b6tpkaeXSg73+n9+tVTmZHRFbYS/3fGEKjMsZX2h
	QP1jJPQaIDGBdYXqAFwD8VwbUFUcJpswJKnlf8TrMee/ULGbpHp9UORlpUYRP1/8re2696ihQmZ
	raCHYC4Td3duRK1uFfzFFO70ZeH11n1KanP2o0L6jxqEeZc7194ciOdOno96UEhIm07ejieNsYn
	iddMvMsgAlPJeJnTQqfA4AKcbzlHNaY2S1Kku3QzeEEFvKvSO3Hur0K6MtdREzac7l9QrSozeqv
	Hivznj+VuFLUdSobNhHmqvWe0+VH69fV6IC0n4SziovnPRSYk9b5zlN+20FhHmoysrOopc28=
X-Received: by 2002:a05:6214:4a02:b0:921:38fb:3be7 with SMTP id 6a1803df08f44-92138fb3e07mr529506466d6.2.1795788724960;
        Fri, 27 Nov 2026 06:12:04 -0800 (PST)
X-Received: by 2002:a05:6214:4a02:b0:921:38fb:3be7 with SMTP id 6a1803df08f44-92138fb3e07mr529506076d6.2.1795788724547;
        Fri, 27 Nov 2026 06:12:04 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae80572914sm58914361fa.39.2026.11.27.06.12.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 06:12:03 -0800 (PST)
Message-ID: <03c360ec-fb3d-4bba-8c39-2dd476f87925@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:12:01 +0100
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
Subject: Re: [PATCH v2 2/5] clk: qcom: rpmh: Add support for RPMh clocks on
 Halliday
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261116-halliday-clk-v2-0-28208928da36@gmail.com>
 <20261116-halliday-clk-v2-2-28208928da36@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261116-halliday-clk-v2-2-28208928da36@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CwlOFQjBwNgk8E9-Uhiabc2PsdAAUpiE
X-Proofpoint-ORIG-GUID: CwlOFQjBwNgk8E9-Uhiabc2PsdAAUpiE
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b098fb5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=bJUmpo4LbrwfO9ae5mQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfXxjxNY5qqZ3Nu
 Ix3PonK2nj+wxBV6u/0c3Nz87BBn8k2YyoiWA8zbHass7ogJRCBnrtGohhYRi77S5hl0zahbvyZ
 Yq7DgF/qJAFnzMzgr2TKrdvVHCZ9A1g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfX3H8LyZxeMPO9
 YtHkxeOiLvn5XExsTKjvmzTrE5FNutJM4OLwcUruOAudPBfoqyJP+VQORizhPkgkgeSm7ke0XPG
 +ieObvRoYWZsB3fAsz7HpMnkOys2CFeGZd4NVs/Jsn9V6uwNYLpbawJRnE5KCqp3xk3uzeHVyTh
 rhlNXiJwtPwnU8md3LiX9wPMANtEls0fYRpX+UKaImZKXE/jw4ZGe7KThhLeW2YiU5DIzjbDQyT
 MxGsD+GjWATSFe9sEaaIsBwaRgyp4HMR6mJqsvx4qiHO4tQinMlWWmtKq3Jr4jLhHbqeclktNS6
 ncug2ShGNBASF3Ya+llsh4tPrZPiXbKsWth94GbT9RfkV0CsK4HEiciS9MTpWAfS/MB6E0PcJ/j
 V6sAx6rN+/UXUfo2kkIsjibWiW8KvkkP1k7sizo5qNTzSmuachts0XHRi30Su0XRI1B0QaB5vO2
 xb/5BHiHvQDWTzCfQCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270056

On 11/16/26 10:24 PM, Stanislav Aleksandrov wrote:
> Add the RPMh clocks on the Qualcomm Halliday SoC as Qualcomm's
> downstream clk-rpmh driver describes them: XO (divided by 4), RF_CLK1,
> IPA, and the clka7, clka8 and clka9 resources (downstream LN_BB_CLK7-9).
> As on the other SoCs with clkaN resources, clkaN is LN_BB_CLK(N - 5),
> so these are LN_BB_CLK2-4.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
