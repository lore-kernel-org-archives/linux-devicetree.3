Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676FD3B71B8
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784537579; cv=none; b=OIh+BRzpE7ovkkDF8f3SljkuM/gSNC6il5PyITMs3TciuI2ZayXTcTVJQ1Bt//Aa6zeebtxP56BUUVci4NNXLiRq/HTWSGuLvrQOoFYJNOSLW/Jkw4f7ch+R/8E301UcPEQuHzpsYKmi/SxSmK0UEwGSUeJBP8TXeG81jHSBHUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784537579; c=relaxed/simple;
	bh=SsBzI/PD6qzLLNqrqd1osStr1DlivaZ6EJ8cNkglnZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PAkFC8PuF8Q9jEh+YDVA/IewkbLU0BgKs+RjclimneDnHzSPw/a48j153HYlA18m6Vbe55Bal7Q4dToH1IQIazitmYQgaKU2pG38hGBf5USSRln2pvxt9I4BLsPcYo2WFkG/LiKB+pe6wt4rScitWbfXcxpAaGXC8wAok8fiYy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QY1HXPW/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZksJPQt7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QY1HXPW/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZksJPQt7"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RW351665624
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eLBSggf9hSDqD6MIIH7JLc2/MxFtzpYYEFMoFUF35Wc=; b=QY1HXPW/GdX8ra4f
	Mmir30ZFzKlSQoS9yTRBLR04bMFxbaoxTLAZuKqwkjZ7INIQvswCvCe/UARyZWiw
	IHi3bOD1Ak4NHfLoyKUAwGHJeluRJbmsygXj5Kgy3qtFKxNk+mYl+tS4PTenWL8N
	Vh6cWJqZu+MIr3esD9DGGCQk7QDLgElQ00905GlOm+t9CgW5CXFww3TE0LUxC7vy
	aIXKpcS+fVfcP+3Sms8x5BrOXQb1YjdxNb0Vu9D9b5VSCogUkaxoXb/eVfn3u6xs
	7oLvJqAC5iJRzGtp7drMtRCS5HQVhSXnUTmZCQpl/W3kl+1Dmn+jxLivM9ncCVQa
	/q80gQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fgd04v9uj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:52:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e6415f279so140203785a.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784537574; x=1785142374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eLBSggf9hSDqD6MIIH7JLc2/MxFtzpYYEFMoFUF35Wc=;
        b=ZksJPQt7te4cTA4xvQsdeuA827BYlp4ErywyNDyJ2T6lXQoeupfSKH6JZBmFU0LrbK
         //WFWVBLyTVNXtoyGt68QBiEtaLk/xMLwb0A/ASeNjo5qX+2JiYVJb5gXrB0VybVG3X1
         ju/UKyTZalB4nngxjWHkimZWH5SNjwed07lgZV1xRcsIPWqRQaslYljYXEClF6qNNLco
         t6LE7lqrMBOk4eakppeGR4sHbCSVZB4902AAGY7TEe8wc0B8JqkDpw9i8FdhNcf2EmtF
         sdTM5DAyPnGurANJ3n1LAXURawl9OLr9cLS03cCup3ee/3fQPyXQJ1hAANxCtsNlyOJv
         y3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784537574; x=1785142374;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eLBSggf9hSDqD6MIIH7JLc2/MxFtzpYYEFMoFUF35Wc=;
        b=HIrWRRaE8eTa5LR3fM+1pXOREulbCC6iNraL80zBrK5BBXo7t2dEUVmbcLzSrnSFWW
         rXVY2N5nx1t+ASB2KoUB2o4ladD6H6r2ktKW75Vf3cnk0QKClqoV1S86d/iK4KrZCe9s
         Y7EvLYagEMwaBL3v2ikmiL7ZwQ3Mt1ZsgU29CoM8bP988y9/t3XrWjolPrPJflYzYpvP
         SQQ1/MA8GNnZrkfQBaUXZOyQXuytV0gjUMZgVA5HoOHtliQEVJIUznMeehCljyeXbcQz
         guYzN9aB5yWoBOV5K/WTz5TmkEAxBj0+KElD9FToozReOJnXG6NXYgbQ44NZ5/fQEKJ+
         ajvw==
X-Forwarded-Encrypted: i=1; AHgh+RqDXUQ4eZZYuPzmeNgEToCAezgpCRNdiuoc508P6sBxHbIH9eCxwYmH2QEly4qEbD447YhUfXi/ZVgA@vger.kernel.org
X-Gm-Message-State: AOJu0YwhQ4yqWbHbw+RMt+5/4aTRW4Sd1zz6a7xuI+hBoZ2+9hCqf4ax
	dfEY0Cnf6YBPYWYGOW3TvVEOe/0F8+uPAaCRpKYhtNQjNpGgUiIej9OwAgnQhRVLR1UpaBdRRfe
	Lm2y1QXjE2gLHYHkbXR1pTmeB7jObkSArZ3SXD2J4RC0soPrRAWfF1jx3CWKLhN13
X-Gm-Gg: AfdE7clDUtBbsooMz1vcacwwjbRfQyiLNiOJdfZyVPmKndznb/4uWOoeUxtgtsRvOfy
	T6MSZa27AES0iLL6w6mHwA5JocqL4ytof2+RzJJbJxhA318cjeAaWCGIzpdlJ9Xrnzn41VtMKgj
	IVDAmrqCLwQL3LJG1LZmTLK1oCPIXvMk9vtKbdc0+V3KF/CTkf+mokFsoGVkr/tFJAVBK4BqE3J
	ZdbFcXofYImzTk3Wp01vmhF62u/d2+X1NC8n6/szJIdZugPhnkCgQHLkkSauOt6nItP2SLZbsFz
	OcgmvHKP9GUH6gk1x4dKZljJu8+Z4xnIQ40KYAVB1zr7pvrBvbRCMCS3iBr3mZbGI+KryULMKKE
	dqO3mLHXTrBDKK2Fd7sgXNBGz
X-Received: by 2002:a05:622a:a993:10b0:51c:845b:ac4 with SMTP id d75a77b69052e-5213d7b01a2mr74188031cf.3.1784537574640;
        Mon, 20 Jul 2026 01:52:54 -0700 (PDT)
X-Received: by 2002:a05:622a:a993:10b0:51c:845b:ac4 with SMTP id d75a77b69052e-5213d7b01a2mr74187961cf.3.1784537574237;
        Mon, 20 Jul 2026 01:52:54 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5f986sm430075566b.40.2026.07.20.01.52.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 01:52:53 -0700 (PDT)
Message-ID: <2ab2db19-b193-475b-83c3-39436fe74a01@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:52:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] firmware: qcom: scm: Allow QSEECOM on Kalambo CRD
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
 <20260718-b4-kalambo-crd-v1-4-a1069b5a2757@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260718-b4-kalambo-crd-v1-4-a1069b5a2757@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=POs/P/qC c=1 sm=1 tr=0 ts=6a5de1e7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=4_LmeBUvQ-T7zM7h5YkA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5OCBTYWx0ZWRfX2pMdlI9qZgaA
 xMBDtqxXt6ESrWo1+iMkt7V7JY/gmx4H93JjLb+L/97ygimnycnosoU/SL6alzpinUc0Em20Wn8
 X3A/7foNxBQKCdzKFFqbU7jcGx4aZxydtrefIpUll16Y/yczCtQ5OfV1TJa9rTMRHenkc99zQ0w
 Z7gukBBcCpjBn3yGTfb8+1fBgOCpmeiU+J4d20wmEXJio2g7J3VIWHkghw1Bg8WEnmeqqXhvTkx
 6dNVUpz+BS8ZRuInCMVWPfRSGcvii9NA5XErJWCeKZDpQU+q8yOpyO4T+SvWiGHwtF8Wri/T6vp
 AVkQ+q1QrKqNu6y2lA/aibCsMh4CdtBu/a4RLOt6YxcbfxraZZRPlhvkyjNr+9eW1GHXe+r3kzB
 k32+AM4Ijsebn/UZKXgy1DvkoJzV/NP9nCWLrCmxAYRyVAS+V+keSZ2ssE1EtAv/jXmLdm52Iec
 J5TwXOXYHUWDEbhTEDA==
X-Proofpoint-ORIG-GUID: 5fG3UXkB66w_GWJadcBE2vkdMhNH1lEI
X-Proofpoint-GUID: 5fG3UXkB66w_GWJadcBE2vkdMhNH1lEI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5OCBTYWx0ZWRfX8AiLcoxYYas8
 tDTKqqDZ+Me7G5g7MRrAm1HbTVhYSDCvCaryYpIJE/ZPcN3kC5AIKXWvU4jyjMQsauD3USOAxBc
 UvzonLUiwSwatr0sP3MjVOVY6km3NPA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200098

On 7/18/26 2:06 PM, Gopikrishna Garmidi wrote:
> Add Kalambo CRD board to the QSEECOM allowlist for enabling access to
> efivars.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
