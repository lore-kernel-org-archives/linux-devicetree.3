Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795811614;
	b=osjppCayMGuYUQOGNc4PpSQSv15myq/kQOkZbsmWFIygrZvg6I8fsGjZwwqVG6KTG2O/
	 2/17uGvoTvP9twarJHiBh9vCv1nmelPR5nQ/dCvp43gv57TZCe8MlbLZsNh8mqNW8zjpY
	 pOt0EybYS0KgbqM3HuV8IDpwhEymjTzqq2G/7Bu14j4fl3qRGyKfwlRCorm8gFqueMxWc
	 bkWnpHq2LG4GStPZU1drhIagmHAlRP3xBmEvFznBZyi85QpxRYvHDo53EyR+tSmBxvD16
	 dT/ggC178/EUESgTeypTchKoukzAz2Kzm6fiG1brfvSV8yHvf0uB+roleFIh+BpzbKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795811614;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fDw2oTtTVNYhbVTKOIRkyND9epGDh+lddYNBFQIeGdA=;
	b=BR5h5PGYJnd3eawq9OSQhFqpLKE6CjCP4IvGchqgJd1xLykYbbqMX9c60RNUdoZTXFYN
	 YwfT5ZyvCCytQ3wjUw2QqUXWYIvPeqXTY6TO4F2JdZbOzz3eGsEPJ5pu4917uTW7gRBmK
	 oY7p7RntO7jCIO5Ka5RIbOJKZN49uKFVZ3Ma+nrKkjQugWfRLdoGjQbcr649+3R6O89p3
	 SffZpID9NhYioONCuArr+LC/80zrfh+rPly5aMabySAIKhQJ2dCA0/UYlpIgEhwEdnWFo
	 aj0wdO8TT6trcI5NB0cOJ2t3mdHV85AWFEiKzHh0+zVvhV0CLl6HrIFl16Q2q1784rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D2MjMSug;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L84DJlpL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792B0606A31F
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 20:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 792B0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D2MjMSug;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L84DJlpL
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJRbi01381601
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 20:33:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fDw2oTtTVNYhbVTKOIRkyND9epGDh+lddYNBFQIeGdA=; b=D2MjMSugSyFOtWdo
	Sp1uUzUX1NZqgct7w1uRpBGcVaYMFGHXMED3izaONkec1MLq5ZlP6jIxP/YNF5H1
	Y2VGLqR3svxU9W5XMjpf2ZNcqV9j+SyDzEYBnlOBDXtjpT6XS2PATW4W2BZf3eHX
	NkcTV+DdzgdxKq0DKZbDI9t+auOGaruKHmcUCYOo72RaT4DvH6ZrNS+bJ8+kHarw
	zuqdjhP54iLWy6UHtyeprW5sIzU+/7CaiAzsBEetOUg02CdyIcG6CUPKkNMlwhuU
	ZzDuWOj85UQPBTCyVkur/MAPB5NZFfCHGdLiwfSqOYIcMtLDXjrDOKzrRyFGFPpc
	GR5LjA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7g1s84f8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 20:33:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9496ff065bcso1126338385a.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795811611; x=1796416411; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fDw2oTtTVNYhbVTKOIRkyND9epGDh+lddYNBFQIeGdA=;
        b=L84DJlpLQMuuLX1474Zyqhz4pjYjnDMjU1URHM7HjHg75nD+197BbJCSFg/4s8Hyyk
         SVReOX+CMRX6BpffaDgIx1UDihf+AciNlTY7SiSEMtI7H3Ol4qTVHV499rjf4dJ7WFx7
         WnalSSOza2cqx7gqZR4BglJS4FzdKvQrU6P94Y1M6TmOWuAZm7ZMh5GuZh38OEu5zCxv
         d6qBpL4vQcA9OK6SkVrESbKrunA9T7QN3y4QosHcBTgE0umeOM3/7KIvrPVEQnwxantF
         0Ox9C+7uEsh0cDg/zqtMj7y9NTF6QuVglwV4XXB5dM5elGzvfC30kpe3wPpzUt79yJq/
         yWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795811611; x=1796416411;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fDw2oTtTVNYhbVTKOIRkyND9epGDh+lddYNBFQIeGdA=;
        b=OxAlNR9OFccaM8mwOpFXf4XLZLiIdhSBy/tEdykGaks5ZJ59NwMa6XpZaZVHaOlsNp
         gKeIUNbAEW0zfTbjMVU4KAkJvlodpBoHpT/R9vuFHBU7hBfB30qwFoDS7Qt0vJwmiPyC
         nUn5I3mpR/Bn8EFoSQZUB3+zj36FKCft4XuT9XocSb3lVzs7twdLXMkRtipgWg+Xs6Jh
         yqcQDA6A+FpCcvMaQ7xZJg8/MTjyDQq+5Hb9pix+XuVW3ElnMuDrKNEOTD4ICDO4K/eh
         W3ueecMJB7/l3p3i0/QkG05wCwi2Vf72TuuF+fjE+U6k+KSX2CAqz25vMMeE2KGmgY9S
         3Vrg==
X-Forwarded-Encrypted: i=1; AL+hErF5Ckulx8+gCGfQjUCzPmh9UjrSmlDv3xQO+IVqIqW36+5F7TIY09mE8L9180yMN9+JgQSGxIPeYPY6@vger.kernel.org
X-Gm-Message-State: APuU4Z9qHp58ksDc0irwiW0YIizRrh3GoI8QEODxGxgOyLs21bPdUWlx
	TrG1aJslhcgpRfv8N6vAN6Fnkb8mmU80+SYSFN3Oxv+zdnbRu6u2l3k2sOlaXlXp44P5feIegJ3
	Y7MGQbqV+AzmAF0bTz1+vot29KmTFlOycH26W1uTBLRU+ESFYYrPtnZgRpVPc/uY/203RePWKka
	c=
X-Gm-Gg: AZFdTZengcUKlgoqb/Jlun7j3EveSrQc0DE+5pxCenjV/PfTkLAEiiqeI7XEbZphnhw
	kooTcvKq5MtIzPy9vfEqEZN4PTSUr9FbmTvfGagfYl6vsAN+/0UWNlDn3xrxZHYiwZ2i0LdjSn5
	mF8HWnVFg4PaAYLdhoTRCuI8Z1k35iIDkRJ0kArvTbUW+lO/uFXZVLhhkxmjjujb3QuoFxk3HrL
	YjmTzOyNsjE6mhV6hFj/UypmIV8grHQCyPoJqJjZ6nfCIeeXt7kUKkMfioDiWSPDn9zwaCs3uTC
	ZF4uqTr+ddccSVwJ0gvFbGyxLTxeGoTHwfGh0yUtrZBVm5x8dtuJfv8xe5zj3fBdm8EEHvTUiZa
	+9eQuxKr5Dmv3iE1rF44RXTdjibpRARfddGM6CoRS/01gq/DDmzCxXUyLOlXVWQ==
X-Received: by 2002:a05:620a:45a4:b0:944:110b:d824 with SMTP id af79cd13be357-949ba8237f7mr4779005385a.5.1795811611326;
        Fri, 27 Nov 2026 12:33:31 -0800 (PST)
X-Received: by 2002:a05:620a:45a4:b0:944:110b:d824 with SMTP id af79cd13be357-949ba8237f7mr4779001185a.5.1795811610870;
        Fri, 27 Nov 2026 12:33:30 -0800 (PST)
Received: from localhost ([2a00:23c4:e5c9:901:c496:8838:86d0:bc8c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm46444385f8f.26.2026.11.27.12.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:33:29 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] arm64: dts: qcom: sc8280xp: Add missing Iris pixel
 stream ID
From: Christopher Obbard <chris.obbard@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dragon@radxa.com
In-Reply-To: <20261127-sc8280xp-iris-iommu-v2-1-34692fff579f@radxa.com>
References: <20261127-sc8280xp-iris-iommu-v2-1-34692fff579f@radxa.com>
Date: Fri, 27 Nov 2026 20:33:26 +0000
Message-Id: <179581160665.3905807.4498492741251530885.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=750;
 i=chris.obbard@oss.qualcomm.com; h=from:subject:message-id;
 bh=/XqhMIJBK+RPI9EuGkx2IwbDPmDLtOjbw6QtNrwL4lU=;
 b=owEBbAKT/ZANAwAKAWNNxPBocEb4AcsmYgBrCekY0S2fVKfwIFjsjbQyH7g+1QmnebDfpTH5s
 GJhRi/o3/yJAjIEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCawnpGAAKCRBjTcTwaHBG
 +A5sD/YqHN/8avpwZcoXmtTqsgBr2hSift771T4JYQX5ple18qgGo5YtYwTMuVRoH2nNveoBRZq
 VbBDBYwJSvoG5vEe6L/UfCDX2OrskZj6+Zn7MikoeXixmIkCYrjL8nhQPgMtbHjsxH0K2soDl+c
 nOuWs6M8/BV15dI2gtAJKhslnrbECsvGzkzLSMhs/bHID9AcmIdmP1TY4y2uA2gtiJQ5uFHMnbY
 WzBexs1oh1gWkK1XkAcp28UJjRMAPSeDWuOGx+PPyVpDYrW3PTKRb+NWL037ZNIPZ6K89hslAiU
 ewuoCKqGR96u3yDAoE3wV/FvugvjQQ7XvM3kzNN/zImeCDK6ISE8txwFhdvXIm2zHdDmYciaeOW
 ygL8p8up1FsRARwsqhL4DdB+/GkeQr/wwqRzlwmC1tfePUjJNbhB6Smd3LG8rmS82G9w62laRcF
 qT3i3KScsXMeJ+7bNro+qywgitWDEUCfHA1GqQw1Hnc9GZaVtqqpm3PCyUnbjkuc6Qm1XiQeBje
 gLVQRj3qpfcm0hhEGdzn4Gf8/O5yu3O6CtjY3QWGDsdUC9htgBs6LNG+H40Vdewzmk+ZdOafxBm
 U48zm1p6mNEWOw/4AJkzHqV2mme5pKn1BKSlOXx9+k+SA8YKN+U97aMpYunN7HtJFz7ppztlDWo
 cvEeeqhzWq64f
X-Developer-Key: i=chris.obbard@oss.qualcomm.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Authority-Analysis: v=2.4 cv=FYOiV5+6 c=1 sm=1 tr=0 ts=6b09e91c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=ksxQWNrZAAAA:8
 a=EUspDBNiAAAA:8 a=d2b-pOcihrNWfEhQPYEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: zIBu8qAoh6BfpFjaKIUk11hY73P4viRm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfX9I8SWFgtFCC/
 JyPZ/dBQclMmCc3V7Rnnyi5J+1uHYzvJbGMOFJx0Q8fvcCTmdc/eb36zf6xW6CXVxZUDMaMmhXm
 1N/7sZdbciWhxaZDnY0QhX0pzrPffESmXYchx2Tp6WJinas9Izg29KzYxf7osQeiWCDxOl+QNqh
 oBIPtAzpKRHjQYOt06a2AM5LYAMqU6LHRPv0zDjGzmM2O0LHwfzh0GTmpgSzQVGMlrErVeIGWai
 YBLSQvn0m3Cw6YcQDmbAaq+ZnhlUSu0HUa1lGfIDI0jce0UTsxF2Udohpif+tIF7zG7ZmWZsbXf
 KVIR8VwtmdDQ4mfGDJVNrfgmmSNJbCmRAChwlTw+Q/SL6fHh5rEl6PWF3tTPeVpMFUcokxx9nSc
 rN0j9INIEhODbwHvFGVCwq7b8r8LyE5FvhhqbmfUaOgqWy7cu342JPeDGNQ3pMuP7kiB/nWgREs
 muuCLf+T0MZb3lRYSrQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfX9nnABtmhROgT
 GapGK9uDISkbo3yJFh/Re4dDBesdhbPwjxnr6pZVopFTXceeSIU77O2U5EPrfVMudm73nlrsBkY
 ip4EcMJvm5q96uPrKSeMeWygGtzJkXk=
X-Proofpoint-ORIG-GUID: zIBu8qAoh6BfpFjaKIUk11hY73P4viRm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270081

On Fri, 27 Nov 2026 16:32:21 +0800, Xilin Wu <sophon@radxa.com> wrote:
> The Iris VPU on SC8280XP uses separate stream IDs for its non-secure
> non-pixel and pixel traffic, 0x2a00 and 0x2a07 respectively. This is
> the same split as 0x1940/0x1947 on SM8550 and later platforms. Only
> 0x2a00 is described today.
> 
> The Gen1 HFI firmware sends all non-secure traffic through 0x2a00, so
> this went unnoticed. The Gen2 HFI firmware puts pixel traffic, such as
> writes to decoded picture buffers, on 0x2a07. No SMR matches that
> stream, so the SMMU raises an unidentified stream fault, which TZ
> treats as fatal and resets the SoC:
> 
> [...]

Tested-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>

-- 
Christopher Obbard

