Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794780480;
	b=Av52mHye5pa4dETU6JZ+gJ3Y80mQjcxufkM6zHTcT9wwEZW32xwxayDLWeuZrUQgDJ7z
	 37fIhnicujiRSD5pkZg2c4/TNb1/800QyYRH9izyfoyfLudBkLpInZ+3urItVqE6Ob8JQ
	 EsaC3krFOv7327Ci0QOFlrZvvzK1de0IgY7JkPzuI7W7cJwzgJ/aVZ+HKcikRf530cnfY
	 d/Gd8vKegSRMYJtwNelO/8R/MGYLQgSYNN/atqdvO+sy6rk45ukGESSSO1hcf9HZOSkxL
	 WGvTzPosOAbdLdChp6GqbztmR3k6WUJwk9M9KNrI1dWNptaosicqARx9uh7uCqkGmTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794780480;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=k9dCgqBsP1JDVCF0pQxP8lz2vqJjfqt5PSS8hR4Mu/I=;
	b=5QJPAAwnoav9yFTJN04WMg5uB6K/R/okgkD5ufgPYPzLbpSRCxUfzid/MAC11+bXYn2M
	 ax/+8MvXYUoiiubfrxN1fNHRYOPjWWZsrq30PcIHaQI7+HNjn/HEQDAN0T7zZfwfPcdgb
	 pT90rGksr8VgmJPJij5r6hgqhHxOOEkU5RLVc76Dszfe3Sw7TkBL/QhgTVMA+owmSMi1J
	 RvTnTPEizqFwim2rC+v/ZAX7N/SRkAO6EWEXxVmq6lWKar9kYKdltOQ/nHrjC9QwDV2pN
	 k7AckD2nD9AInIWp0dkre1082BEQbv1V9J1d7tgngxk4f18d1oram+ZD2y0FkBxgTrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cKU4jBb1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cwMlpBdj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C98606A329
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 22:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11C98606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cKU4jBb1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cwMlpBdj
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AFLm8Sh632929
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 22:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k9dCgqBsP1JDVCF0pQxP8lz2vqJjfqt5PSS8hR4Mu/I=; b=cKU4jBb1oLOwttr/
	x+PM/xgG4ULXw75e8nVkQtD4VZzNqylIGqUp3nRwM2qXuZQq3TQVpklLE8pDkI6J
	qFCN4F1i29jd30aKeAUAYZhlTqoGR5jUs/9Q1VIjMzqc8k/rbiueb5Soj4Fih6lz
	EODjcHq9QnuRk0dAHzcUaDUtWEwOr62PyLbjSZgBfmPO1MUPHcNSwnnSIM1LKzjQ
	BTdxvficyIc3w3j79Q6qs2d9gfpzqbzbFlm/OcwIcQ4f8vqI4S/7KnkaeRYhG0yh
	TJHKw9ln7huNRG6Qwv1SpLqTMdNX8IR4HL6kwbqN6Ar+H4TigrzLLaq0YbKWMAXG
	5jbM/Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhduus1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 22:07:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so567293785a.3
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 14:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794780478; x=1795385278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k9dCgqBsP1JDVCF0pQxP8lz2vqJjfqt5PSS8hR4Mu/I=;
        b=cwMlpBdjKKbckSpfK9lRkulNcgARW/rozdeQ0ZtTFCbnsQwe+ko5dx5br12kCcJvEZ
         EGw1vQ2BNEuo/8Z23F5j6LSgTfUfy/rXTewT2hGclNaTQFQSOkygrv57a4ZhOWNlqodz
         eOEIS+8Kbem47IxV6IKO+0uQIA1UGgrZRpSFdo6FSMI7kMfJqmLM3GOS2YsB08ELntmA
         TGE4IJ6QQVjyE69ERKrxVKzHLVt6wpS+h57bSlM0QaTGwAvk8fEzeHgHnjo4PXkLx3eV
         oGwNXhmQ2mx6XytFYXdYhTRmEzPFMhgmHmzxVnGIX7LBfeDsv5+DqvEFS6oJkJldJJH4
         q1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794780478; x=1795385278;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k9dCgqBsP1JDVCF0pQxP8lz2vqJjfqt5PSS8hR4Mu/I=;
        b=eStYBsYGMmsJh/HR6IPVA+sC7J2Lvfych0A7Q6awaCSFyfZPfj8jC2+AbhxrtTjWDI
         P5EByibta7xR/FhVsr3bpD+5urBebIt7HphdfLZ9MMg08iKPzXsMzhkHJll+A6lFNXxE
         Hhnuqtkpd+ackhuDxx/h5pPnXjPsKGVs5J9cUtNDRCiD/QNJc7CwpT/N/ODnUwQvb3Fd
         kZA5ULJEOJq0GK1QbkteY/qA+4C/6y74c+UVWluKa0o5H8exy6p2lsOH6dc+tDJxlBo+
         vW65TY2D43cCf0zmkv1Dfy+LDeUredgL3uhIFhjeP1FHo8Nb/ZF2QiKpTxePQCxrtBiS
         mW0Q==
X-Forwarded-Encrypted: i=1; AL+hErEQGHIokZtl4TILjYpWx2TN7E3akoB3kfSqRAqT/3Krw1lObvS6i3r/2ErlkE9JagSqYHRIoQOuHCZ1@vger.kernel.org
X-Gm-Message-State: APuU4Z/M7xg23wBou6lSCsfMc5lSScLAkcrEaPgMa5t0RZ4ufKpQh+XL
	GrOOFS+ihIXhuntSbb5cip3D+guayLnjguYfdbKsws58VM/w2nDoUzvs+Zg8oeRXRPCdbBYeaz2
	iXUK0Yl/wOuMmbHTNU2/gbys6vA54VEUIzYgbIy80CskQHGI47F/U6PlB69TSCpS91j3C1xAHka
	E=
X-Gm-Gg: AYBFou0seumUwVAJ1RwhNRDyefwxYgdTUCT7WsiaOhM84+wq6/f/rYi/DMEAhe4r49h
	rNdgLv5NdJ5VluawxInljgEcv1PgC7r+9um34vb5VeNlNVU8Gn8B+1HTcrnmkzCRv3Yt6X4DZDA
	pwCtdQAWD2dajNuGDj8j7VZmr0s3dwDNczlK0fbmiVXIfCXlk1atIEip5/R28OPo8zHQcFkNtty
	1dzeTG5SPfBJkNs1WLC5yC40UqZpkgmtQyldpkCGC9G1jciSDwbzhMfxv5BRcsO4ek8k3o2FoDJ
	OxPnDpPAOYYjUyjze7JVggUtgNrxmgb4yVUk0TbfrCRJncR+v/5usQbMiikbU1qjKhyrRmGWFOd
	EzyEPV6tHLAwhD+k/U5ZQ4+h0kvC2gCNRR8L+Uu+WmnM/+mEXEqSJpl2iKzbgeZECaahiu+kMpZ
	FJ
X-Received: by 2002:a05:620a:618e:b0:949:816f:cff1 with SMTP id af79cd13be357-949816fd194mr51589685a.7.1794780478255;
        Sun, 15 Nov 2026 14:07:58 -0800 (PST)
X-Received: by 2002:a05:620a:618e:b0:949:816f:cff1 with SMTP id af79cd13be357-949816fd194mr51586885a.7.1794780477782;
        Sun, 15 Nov 2026 14:07:57 -0800 (PST)
Received: from [172.22.9.204] ([217.110.90.56])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c608cf46dsm19639489f8f.43.2026.11.15.14.07.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 14:07:56 -0800 (PST)
Message-ID: <65e3d2b5-a48d-4ef4-ae89-68a15ae7466c@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 22:07:55 +0000
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
Subject: Re: [RFC PATCH 00/23] ASoC: qcom: AudioReach Active speaker
 protection for WSA884x
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Fabian Renn-Giles <fabian@fielding.dev>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261028163152.26892-1-fabian@fielding.dev>
 <110e1d54-347f-4186-bbe1-6aa03aa8ff3f@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <110e1d54-347f-4186-bbe1-6aa03aa8ff3f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VOVIDNPX c=1 sm=1 tr=0 ts=6afa2d3f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=hzUeyGCwRGS7WCfWEAyTKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=2dS5UIqEM45N3m7Sd7gA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA4OCBTYWx0ZWRfXy2xFffyBP8n3
 v2A8aLrSxRmX6UNDD4+qKzhWlwnzIVmaIMpuRdGO9cSrh05seO6mi/lbmTuNxe43X/CnigGgAe2
 GeKC42ja7nXNl+DnP8tNk+Fg3qscWA0=
X-Proofpoint-ORIG-GUID: QAUX3bHLspbZa4s9Cxi7dPi1I4inVh8T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA4OCBTYWx0ZWRfX+VZHDm9YNKkx
 ZtNTIYfrYTOV2KyirAZ5+HfGhfgaQ5z4nBrxl+uDtCrM/P2tiWBpTUR06+ZJ7lVGS+wK797UgxT
 7KDrDRnGhRoQE3OT8zSl/srCaPyOj41Js+RAfM3lJ1iEyt0SdH9h+hWneuzPyrf/0elCc/tlub5
 1hrdM/sJlrVkF3GXk3pY5u9wcmiaERvJnHnzp1SbRz+Ne7AqJ+ed/J3PT2UpRgvxSjQ57Tk9pPV
 tq3jiCGYoRFdEmrnrU1jP1XfawXO1sG+ERen8fwFGHeCJHIlIBKKaeY6JxsDnFxfbBL2yY+FJEX
 T+yV2dq5glsdtusOJRcK9NQ5XCtH4mKlG2VNRceUlknbcgzEYxbw5KEXM6FWqEFslLobQQHXkEJ
 dnDh35Gclq57yycjZFiCd5U6KXjDqLthmxyuDTU/YnmD/uDPaxniccfzbTiC7XuJrUPLdgf/PS8
 9Urfdd0yqdSaeG0yCQA==
X-Proofpoint-GUID: QAUX3bHLspbZa4s9Cxi7dPi1I4inVh8T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_07,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150088

On 10/28/26 9:56 PM, Srinivas Kandagatla wrote:
> 
@Fabian,
> My Next target is X1 T14s Gen6 platform, I have not tried it yet, but am
> hoping that it should work.
> 
> I will keep you posted.

I have now managed to test it on T14s Gen6, no changes to these patches
to get it working only thing that I changed is dt and tplg files.

thanks,
Srini
> 
>> The function allocates

