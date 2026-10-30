Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349399;
	b=khLnIoG/NL48pSAb4qP28u36F4UJMRihJ96iHfOL1XhPWB6PDxCnx4M+taOzuVj2BVZd
	 nwqGh/1ZnxL/iNv/Y97t82e1+Hz9yLC1kC7bxywVY9geysdHqY012cdESth1qV6L17sSg
	 SCP21A5F3KymqcIqp5siVI3E/RuEm86JG3HUMtnmyM7IdvlQ/+QWE67nzRpJ6Knq//HBg
	 pGLR6+sMw6wvIcYNtTsv9VPqaFV6r5hSMbgttkJtQbnbrBsD9tA7f1OWkFRovFyKOer9R
	 p2+1yWjZbUoxj7kUhN9tpoN9x9pqqS+41HrtvP24JHQG+uoya/YsAgkDw6UlcqQeo7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349399;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pw/rj9q+UHb3g+b1NG7ao5fWfl9kHMdGuItNZtveQI4=;
	b=NxNt6W9EgCWMy7voypxKtzDnZk+09LJ7FbVJl6KH0Gbu40U4P0U+uhmY6gJzkZeJaX3T
	 jwReG3ZkguM4SlG6HfWL0HAfho5lxY15FQw0fPVxFXtM0mmNzBEXrS0cYYiyRSrSSh/9T
	 YxCwqrJqm0dEu/H0FwlYuqThEEiHT8HTnpbpYr9j2p9X3a7f2/X1FEKHKkgaBEKoh85uJ
	 Z3k11nt4NheVlQKX5G+BujV3rMEj9t4BLelvfiOgYoJ41o+5FUVBPR3aVcvKz0qPyzXTI
	 totMsmN5J8zSSRJUH2YWu2cYyrAXbpcGw3NtIHUGo66m+y/xbU0quRQCY+eHpPvlWOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W9WnreYI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JHOqJwzU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1827B606A33D
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 08:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1827B606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W9WnreYI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JHOqJwzU
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F81V2374144
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 08:36:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pw/rj9q+UHb3g+b1NG7ao5fWfl9kHMdGuItNZtveQI4=; b=W9WnreYI9LphC9NW
	1Jl61Ic1/IqHICYDUusvMS3TjbBd/x++wnlCc8YqRyZqNELPMI2HmJYyGbdTZmrD
	lWnf0s73ct2gBXV2CgH5ZakhKUVVEsFh3Nswc7DGQ1xUpDw/sKPNvU7iO5EPCi6/
	xIP2qreA70Ji3gKqW60Axu5STb6xCfQ3QJeCoAn+XdVAu901ICFMt05rZmioqwWC
	d7mc7wvd/L/LgI0sJzUnaOkVXeHQFrFyrOAeNXxQBJXeFOitROEsTPHulU9GzAUj
	RTiryNotolacpDpyVHMfVbU+/vD+7Xk1EJMANdQh3WKJaA7N+K6jWko98+mGEHLs
	YGf2Pw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qj0v6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 08:36:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ea6b66e53so10133685a.2
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 01:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793349396; x=1793954196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pw/rj9q+UHb3g+b1NG7ao5fWfl9kHMdGuItNZtveQI4=;
        b=JHOqJwzUUXwG+aOZGzT51qye0LfFfTWIuilmocscHFmkIJYVOB5SiNQ0Gacr6eeoy8
         SZsMJo9xkWCasb5DAfszCUedPFk/oKlkTC1bo+wpIN8wQnYW+X3ZCG0q/fnnI7X4ySrQ
         K4U6b/xhBt3Hxqvg84OlICsGoHPi36gpy9FN1CoU8vSAszGa9+BpI+jIEM9Yur4/WYSo
         qCSqX7Clv4GU72ZfCTitkwUNwr4OcZjvOx6Dk3zY23/wk1RsOGuSfBXcrcNYnzQ8Hs53
         FevjLnlhjFfrOdZb3KNPYfkRGEHnPWYXnrMEUx3bbG5FDC4ftObjOALL5pMEx0w9TCxe
         NsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793349396; x=1793954196;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pw/rj9q+UHb3g+b1NG7ao5fWfl9kHMdGuItNZtveQI4=;
        b=1fLJ7teWaxZ55nz9j5NORe/0f+lghd5a8I8WoYb+2V3Yr/iv96McqwW0QK+HmzZbWx
         xHtmkhVuIa7g+OnN0P9dPFw1J/HC0SvJhxas5wbKpTkDB0oi/bNrpzrI9HTfvROdx+bS
         oSDuntbZRWG+9oVQ9f+GzEalkvUR81UaiheJhpyzPz5vpsCJf7gjAmC9ULYStZH9lFbI
         YzzEmNzCmR8nFYG0c2c+8WlPhM5j2jTcn8EUFBfg7Vncwezf8VZUefmCkHVAy8n53PVM
         dte8/2pNMGtzwASGG4Hh8JVjEmm+NzBzBF7WIUfmOuFlIcPO2KU/xQsN7IIIvY8tDDWI
         vWMA==
X-Forwarded-Encrypted: i=1; AKwUvByTyHs2zlHdisM/eGTEXWFUB6ydcUNsNVMgMg3zcMjls4DCeRP8d2i3OU8lXxb6Ol1wNLGJ1zaqaNMp@vger.kernel.org
X-Gm-Message-State: AFq9FYIdaAdurcvH3wSmDvE6H5UvEg5xkXIjrJDNRXesODxTGsdMcAQV
	3EqgurMJ5JqeAWUBjacGx3hsJa6/OdpwO9VUhhsjpVyTiDS4ClWMQ6n5bLfPrdePRxdMr2yea/S
	FISyHmyMAhwcKxfckSUc9+yP9nl3pVtSstqHjkld2XMRDHAh0UCXsfEHrqH1bSJD5dJ2cPQZp
X-Gm-Gg: AYBFou3jzOfNf5KEDApGkDlep/JSk5GjrUeqRSdpMEny3E2XeEdtvpdyLeqoHrfa8Lo
	1VEofxyiFxdM77xYD/XkEDQcN/BhpfY3ulVl9xlGtNPb9B6vSRoePGRZcgBDIV7x52l6Kw4PR/u
	l2pN6kkPt5qhrCWTKOoyM6pYTIuHlQJh4atcjgid7Z7VBCnn+RksIC/2zPZEYVwPueZHacmBZnJ
	/yjw4GDEoJRNZILoTaEcWvdsYj9TULFho0btjDrGNcZzfaMhgVsQmsGD8eIh8KUKEAqzTszBjld
	yppL7/MexyCVozUkJK9CL7J7Lhs1eVxvblHsYDQGSdF92GPIFrbEqgD5KRL2rxIruLFWVd5NQ9m
	j7U7lzmeNM/kDVnFOWZNbm+H1dPtjAaV61KyhRxoEqL8qdbhV24Ku2FvdxvCsQbsbS1iNtO4=
X-Received: by 2002:a05:620a:a40e:10b0:92e:6485:f640 with SMTP id af79cd13be357-94421762860mr267864285a.4.1793349396376;
        Fri, 30 Oct 2026 01:36:36 -0700 (PDT)
X-Received: by 2002:a05:620a:a40e:10b0:92e:6485:f640 with SMTP id af79cd13be357-94421762860mr267861685a.4.1793349395882;
        Fri, 30 Oct 2026 01:36:35 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe96185sm38480866b.68.2026.10.30.01.36.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 01:36:34 -0700 (PDT)
Message-ID: <831671c3-31ab-47dc-8e9d-5c8015549121@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 09:36:33 +0100
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
Subject: Re: [PATCH 3/6] arm64: dts: qcom: sm8450: Mark USB controller as DMA
 coherent
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
 <20261030-usb-dma-coherent-v1-3-3147b8f7aa64@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-usb-dma-coherent-v1-3-3147b8f7aa64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KsrYSmWN c=1 sm=1 tr=0 ts=6ae45715 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=bZAcljcOyrLSmtN0bq4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: lVssVPPYh_aRb6c9iY-tkchJkmE7M00-
X-Proofpoint-GUID: lVssVPPYh_aRb6c9iY-tkchJkmE7M00-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX0fyBGYgjIOSY
 pDZaui5RfWbfGBAbluARtMnkdMwA5i3X9XoU1bxHr1QHAWMBtn6aDcFShrRdNlonZj2lYUb56bG
 IEvzcsoLSv5OYj5Jj4b1Y5itcOJoqXVxZOegi5Jexq6YqYWu6wvjDxdlWitLmCibLwLskGAn/1s
 q+gunJrZ2PE4OS9UxpW9Hjak4hLS18VnFg9RVJTunUkkGxg+k4hbJC7/R6S452HK5UUU43gdhMq
 i0I4yzF8w/CVvKEkpCtowtyWXmePDqgKHf3Cc65Cv+xlgi1QEhcv2aR8v6yLvSSJvn8Nefo/d+K
 TH7rXSx4ta3wc8ScEFruKLdDG498twhRRkpVRYQ6ZDorm2THkpjne6Ema8c6o8FVIg+1wWYMR90
 7F6oBRd9luOrBJ2TJJgP7DY0lR0bUL39Qo4RY+rB5CIQ5Ag98Ta7t0Z17+BJgOzq9fWZkyYV/07
 10MS+7cYP8S76GcLRag==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX1/+WLuZe1zNP
 lyPBelCXVWWLIdk4sxz212CviLIilKmikFWB9UMeO5aq20/5M5E8kan91D0G048SVv4F6zuhndS
 PqgU3rdPrBA04pDWQbIszf3ufx7Ja+0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300034

On 10/29/26 7:33 PM, Krishna Kurapati wrote:
> The USB controller on SM8450 is DMA coherent. Add property
> indicating the same.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
