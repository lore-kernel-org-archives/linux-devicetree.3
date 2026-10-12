Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079B649D5A3
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818902; cv=none; b=QcGrEnajOYj7++Im77Zxn4M25UONdtJ/4AVo6U1AXjMvTTEOwS9MY+8zWF17o5EZ9hM2fRy4NB1K3o0/NiWvDD/B3jfGjTnJmoxsfO/8JEHees11SD+t0fyuaai9+5qklEH9/PMoTb4KfVk8sNKjDIulpSZ8mpAlUooSOTPBrX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818902; c=relaxed/simple;
	bh=fg46lxFa5YP6/BSzHdXma1atl9i26QcNJhb/fT/I7oA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gQA65Ax/9bkNg5nEYld1STOWTmUQE8RY+/smAa7DMPPoO8CVGMFGQ9lpCoIFniJN+/SSdeeyMNlnIqefMTNSISDLA5dlWdDVzP4Yz04SPzirr4vzEnB7M8EYLgwIJMhRH2EvXPA99wgmfXbt8i16seEV4+0zNNNkMEoOjOs7qVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lZvhR4hm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g8SqNNgq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lZvhR4hm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g8SqNNgq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0Aml2275890
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fhVSxkjTu1TdOr6u0X6bXlPtuzGa2YF0qv/Zd5U41Yw=; b=lZvhR4hme2f3qf3I
	yw92ewGL7tKkzb12W7vHDzrjibe+F9nd0ZROKARrswoB2e0I2ZflwCnWL6HuwneI
	3XNhynkFbnerdRFNl1pIyG+tqwEXUNzS+kKTJpeuzvwJ/AOJ5k/q/3BovjJFSVkH
	7VXL6nFpGzWTbqBdxbSNzxC2SJTf4Utjnc0wyTx0e8fGvDhHndLwzrmwd2Kz6F1n
	RbrQG30VSOxZhX7yzZyn21BGgPQpQV1qVi7UIzZRp7kZxR7Km8abSLVP8f8RdChl
	7X+KoFmyEchss8DV/nyUXytxpqFB0Vj028CA0ri6L+XvP3y8GjdQHWXp0vTBD4D/
	o/FzTA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8udq225d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:28:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5338a4075d3so7632671cf.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818899; x=1792423699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fhVSxkjTu1TdOr6u0X6bXlPtuzGa2YF0qv/Zd5U41Yw=;
        b=g8SqNNgq3y+DmKIEnBbzf0HTraCx0J/cXGq95QXoz7F8XkBFx63ThotZKMXzQnsCI8
         v63bdUbEe89moWLldiS63D6Gj9wXeEKpM4m7LXR5AJdtzaJ4ubQe//eA3D+ffyva293P
         xKPdYxeVl5IqL8wksDsvSJ43PvP/umztVQ2tM2LGW9OfrxnbF+DAk+lKMR9ttiXxMKf4
         tbRpc21ObrIr/6L3ogiQW6cS6MA1c6b/rUQVa+5AYcetatWF/ZtwtlOKp84SWy3sz9VQ
         p8/bId8VnODP+pecOZXKC/xpb4J+YNVTRYqN0JXlIdPAoCLyx0UV5mCGmUbt8oSDPX7B
         0CrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818899; x=1792423699;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fhVSxkjTu1TdOr6u0X6bXlPtuzGa2YF0qv/Zd5U41Yw=;
        b=MqN/1NnUjrH1LwqJMH1It9cPMKZWV36CshLvF2UxZbjIL6mq9QgbD/FKBL+323gXen
         YDrN1KUO2GBK3YGQ8PRT+TPjBGVASLlu7Rx9M2olVsten7b9zruuZfNutTOLrBhK3CQ8
         Q8j9fHinyKuu6Z0NSD4H+Iv7aR+OlhAPc/JCnIfVzxvGuHQxUYB3pFfu8kn/4XvtAvzT
         NCH6o0e8xXTcQ9UxxMgTyhCgfe0ZjlPUiUf6NARqSqZ7JFRRn4Fk92WPTTDpw80/kKqz
         1lgpaiBXjUfWY52M09AGG69+F4CJ5+xssU4RWctuzh8ws7jSvk3R8JX4biDddyGxjYWx
         KLcw==
X-Forwarded-Encrypted: i=1; AKwUvBzrBhTiT3SZMZiK8L23whSjwlItKdZuLYJtJty+BTY3RCXC4FPz3IQyibQvB20FuMcVTTdsTwLYSTin@vger.kernel.org
X-Gm-Message-State: AFq9FYLOgkR5tWciVp6I6pw5nozNAyGBHAQxuDFtjEwsWe09V8YVuOUf
	xvBe4WslhTSc2RSdtorjILnezF+2md/rQ0KI3l+x9+34+Sr9MVtkflhikISGTjLKeAouRenqaOu
	hcRFT2/SErHwbtNqZAv8RODmYw3+gHW8ZHFMJHaO2mTlmJ0HCeCQbm9DduuLF1j3K
X-Gm-Gg: AYBFou0k6AHKUxV1V2TQs9+k4QsFLOFti4syUe88Ln6c6fGboNh7JkTy9AoD2Y3byrC
	ctjOsZsSGofcedH4qJHPPF7kB2sS87cxFrvgcuZ+8WMbXe+YRwg6psfQLo0cTXFABVXtpG6uvj0
	SKhYUJwd755srkFEdYsQK3HrtBSlCKNz5LYZTKB8O3MLiprQpt2wyGyFtR6dQJ1hveprcXcLP+L
	UcY1OraQyCpubf8FAvO/Y9H4kqfcZl7kx8Ot+xGoyQ430f3vzwhkYwKNxq23mSGUJVzIaPc113Z
	7A+4O3Srt5ifcxs1CDn7A6pVZs1+aQQB9dOiqghkAYg8GTfgBBu5/AAW0B3k3mAbwIxxX1hzn8j
	WWuTPI798Zklcw319T7qMQA==
X-Received: by 2002:a05:620a:254a:b0:93e:5ee9:ca87 with SMTP id af79cd13be357-93ebd29bf3bmr1837695885a.6.1791818899050;
        Mon, 12 Oct 2026 08:28:19 -0700 (PDT)
X-Received: by 2002:a05:620a:254a:b0:93e:5ee9:ca87 with SMTP id af79cd13be357-93ebd29bf3bmr1837686385a.6.1791818898196;
        Mon, 12 Oct 2026 08:28:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179e012a7sm5067040a12.36.2026.10.12.08.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:28:17 -0700 (PDT)
Message-ID: <04f35f53-8297-4635-9bf4-5f7250a11d61@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:28:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/38] arm: dts: qcom: Format with dtfmt
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cover.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=evJKXYpX c=1 sm=1 tr=0 ts=6accfc94 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gnF1rBiOnwiRTV_mejAA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX/t+DRALwHe/8
 ESFISxRocR12FkvGJ17hWvU3dnNkwqLhJXzCcCZTawq4kLhvYaFIYMIVatJTUuaJHS2nBbO27Z6
 bE8LY8AnP41lQl2VT/0cxUHEaBlqF+A=
X-Proofpoint-GUID: G4pVxvfokxqmn9K_F8Ez9RgoSJr5AG_7
X-Proofpoint-ORIG-GUID: G4pVxvfokxqmn9K_F8Ez9RgoSJr5AG_7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX7z1ejbIenK7C
 X+4P85Cp7RH67LydHygDr9LBn4a0j+pXjyfTd8cg29tjpAbIhEHb2O3sIi0DIhq/SK/vZNxvtFl
 IzvJrWb8HLiyMr/ZGuigt6hxUumxbdthta5oGZyEyIF8LUg2NQoDOg1xjnT8YgLyNR/hgMCNK62
 jWmO6ol0O2ngdc/NcpXXoC7CWgE5cgN/V6pVy5eoNKclx/NWklIaJTp0km7UuLg6kKL02ajtbdu
 p7PLTc0Qwlgx+yC7ckXia9Q/nv5v/9BTqgq1nJcnD+B1vRbO4YULMpObD026XpBdMpv4FvJX/gn
 dCB2cmpYmRota5dlhkqENCKMBg9WNCPT1CGMg533IBbO5G3o/Gz1ZP2bMeisfCBfVNjYtBg20Ln
 Oz5GiOCHYOWzdQq6iL70aIjE24uhZhk+oIAqQZxMdoRKTzlyFw3GSM7xBTmfVKV09UyUBI1WgC3
 VPjGSWzTbPjsUgir9PQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> I was looking through the notes for the last Devicetree microconference
> at Linux Plumbers (LPC) 2025 [1], and realized that the tool I have been
> working on might be of interest here: dtfmt - a Devicetree Source
> formatter [2].
> 
> dtfmt uses a parser with lexical grammar (tree-sitter) directly ported
> from the actual Device Tree Compiler's (dtc) lexer/parser, also
> (hand)written by me [3]. It is primarily designed for the Linux kernel
> and currently parses all 6872 devicetree files in the tree successfully
> (found with `find . -iregex ".+\.dts[io]?$"`).
> 
> This tool was developed out of frustration when reviewing devicetree
> patches internally at my company Axis. I would have published it earlier
> if I was aware of the on-going discussions at LPC 2025. It only caught
> my attention since I'm planning to attend LPC this year (especially the
> Devicetree microconference and would therefore love to discuss this more
> in-person!).
> 
> This patch series is only a small demonstration of dtfmt, primarily to
> get Konrad Dybcio in the "To:"-field (who did the presentation on LPC
> 2025). Obviously one can run dtfmt for all files and generate a much
> bigger diff. There have been patches sent for
> `arch/arm64/boot/dts/exynos/` previously [4].

Incredible work, thank you once again!

For some fun trivia, this is the tool you might have heard of as we
walked around one of the LPC 2026 evening events and kept poking the
various soc maintainers!

Konrad
