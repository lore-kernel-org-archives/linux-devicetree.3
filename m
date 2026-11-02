Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793602491;
	b=o0RWm0DVBWBSmScI96MT8Nfr9ds6cL7lbz7NMV/DnwCxvrflwJJwxBCQ52qYiWaGy9at
	 nzZjnWJk4A1b7k61U48A/wmtcs9AqBwdhCB+5SfRbR0DIexrqizMIxwQJ4XipF62cE098
	 XW0aMfy4nIkvq+XdEHc9dkqciIluKE0Q5xFe44/iJ1I1whGBCEmlZEWc+XfzCelpRkVXv
	 I6izJF4UbqPASSpDEqSOHIedXrhiUD/Tjr56d4V8v1RvsJIlp/fXvQERTMn9uXg7LihAr
	 TEsJgiYeKWazz2820e5FSZVT6XflwVO1q2LVEZWrtHhnQhh/s8i+BW9V4HenK74fbLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793602491;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fzaE2019/1jd2vdupDOK/Bc+lldi9kzFZLW3431ayms=;
	b=JjEBLrHo9SfXD+cz2Q4kjqz2wBaBZJsjHcOuY7ubWNgzcJS2G3tlV1kPe3lpjctWGSAR
	 hDqv7jeqJKf2KulsLoF6RIdRX1Of6S7lLhtWC9JcM8IkchbBKWkKBkxKzIfz8U1nOvesN
	 Iu1LBeF6zXQprBy8vglIEeG0hnv7sWjGAkoH7wxOePZexJxWEqFPsxBRfqgnQC4FNdLv2
	 WK75Af0WM6L7eSrj6ZREP/BWkx74HHeXX54FDZJTZWD8EiFjHRb2UU89s5S/rZwXmNbc5
	 pavbg8nuDuksIXrkoP1T3DmtcmNiPBJq9CWxmpiMB6dv+mG0alkYLFROKznCQqXOiEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q6e71RUs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Eshi3YxI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C38D606A32E
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 06:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C38D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q6e71RUs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Eshi3YxI
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A26pgtV3120975
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 06:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fzaE2019/1jd2vdupDOK/Bc+lldi9kzFZLW3431ayms=; b=Q6e71RUsA+cPp1qu
	5W+qAMMoZh1LZo+wuJH70y5+an+pbAguoY9PL99DpwF9FunJJyxL77jAFTdK0lFV
	xK7YMxYY8iAiQIEBa/n369Jijei9LlNPwMdTRkEP0A4IaTBGGuOTtSd+sNIHItni
	DwECJXTP9ZtNKh9nFhgCO/cfwTl2K1OJ0k8l0dnpyR2035D0PHSUPJkwkhL/YLgB
	egSMCKavRTNqxcz1uVXBBvIaRTbfLn2qPfdHHneMBnKpj+IN6Jgv7CobtiUxSh4r
	tuOUXKG3H21NfGBTiNiFAZ2X3JCjiWP8+6xP+zhzbYTIaUgjtYcdD5H1SLICFmBj
	62PRQg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmer0cf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 06:54:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae1d132d52so2356420a91.0
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 22:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793602489; x=1794207289; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fzaE2019/1jd2vdupDOK/Bc+lldi9kzFZLW3431ayms=;
        b=Eshi3YxIdKPLD0czPd2ij1XqaYXifnA76zKj+OzuZxn2Mx+H8XTszarH9lj4Oo25Ii
         kg5wHmwf8UtxHVdU5L0V9mg1twpUyjsg4kdctpmqAzce6iY2eRqHsuAtrgKIK09k1NCM
         36epSZjabPUu3FJSaSCvZ4l1fYHKY1c0lY9DKU6uBqbo9SdYy0L/EEr+AOGb5naH42ih
         P2NPNMb68NbXPZK05bBUZuw5TyFsFKU/uvVm30Pf49sAUWVSr3HRGYJ0rQbrTFjMnrH2
         J6kJIDTKxszt9Ar8YBZmo7ZKcXIviC6jwlicyPrfT18finkAMEi0bBUyyS0rJCU1Gfh8
         bQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793602489; x=1794207289;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fzaE2019/1jd2vdupDOK/Bc+lldi9kzFZLW3431ayms=;
        b=PZQoXiKvJSXqMTKozVbK8r1G2AA5hQNiqVoJ+U1Uaz0D/O67FA7mQvI/ihOMbJQMAf
         mvbjdolyr0ajh9+JZZ4rmPC+wQn366+HGXb2cRBiuMRUc2DMg2qJ/w1bswmIx3G4RnRh
         wPy031VOhQ9v9TlUPVbmJSOTrM3ANPzFJxJrXcxnY1L25dXA8McZ6VM2uybjr3PHFRq4
         44zcKOx5Dfm4aX3vExePc6Cyv+/ldLRRpJPK5dR5BWt24M7YZEpLDA9oGi2XVR+cv4QZ
         d/5/0z4P8GCH6xOvk/eqRqxbX87fexZS1oUoV2uP1farM0xVyact1OxvhVIt8c7BeGI8
         Qwzg==
X-Forwarded-Encrypted: i=1; AKwUvBzHVq+AqDM1GW/wzDoluDADDFmuSI6k4Mj0hG2WJ6s8FLneI60ZiOZH5AxpZGXJcaL1wBAUMfLeL7Tq@vger.kernel.org
X-Gm-Message-State: APuU4Z8HtnSgXzMC7Xga3QI+3tw5RGYfkwvRlH5rFMPdnSuaZ4LlnWqu
	JVjkLjIhOWavu7bpuKNzLZ0nBkLe5zyiFXTvzj9xYCdfEOQhzSh83wUZZZfxH73otRizqxEXQ7C
	fq9OyILzAN8BogcZhVLDFiMWHL9h0qsftVgGrzUKS9dUTuuK/bNAYP1rg6rDRQp9AiYF8OqJr
X-Gm-Gg: AYBFou2bbl4lCo/Gnuv5V8K9cZLIG433WGR631NMpXnvQBu3Bk72J2aIqYtDuGqula8
	urzCD1ehMHzulBHzRNbk6N9btJVbs2yTmSyxpMPeUnJwzjNq1mH+JhYWoRAu17fB8ojDS0a791P
	Zp8C+F/8ckbLTMqK0BcODWdE5GAXNgFbthLdlHqnnoMycSkAn2cUZPpZcoqk1hbQbOLx8b8zJE4
	Cohlj3gI6WBuYvXCCR7gj1LAo33hG/9s9GgKuI2DfMab95393OlmXpbWZra75YP90nJT+3q9TC7
	q1Pc9tlWGuZ7MuL67qpToQlvC4+1/sameFa7osmMKA5N3UO+ci0P5nEZ64BU3AOIlBAEy7I6W8M
	5VDCXOGtd8k5GMw2iDTD8+jPlVI16QJEKVU66/ytrcvF64hmULGDXMegUo8RaTGjFpVYAdbBbWw
	2HrXJH14NdRq2iJRDbvUEsYv+HI5FiX/HSBldJgLzk/0prCYNDbn6hvvvtWMhrFwlAshowJhk=
X-Received: by 2002:a17:90b:5686:b0:3a0:e1f7:9b04 with SMTP id 98e67ed59e1d1-3ae8970f262mr7010513a91.12.1793602489090;
        Sun, 01 Nov 2026 22:54:49 -0800 (PST)
X-Received: by 2002:a17:90b:5686:b0:3a0:e1f7:9b04 with SMTP id 98e67ed59e1d1-3ae8970f262mr7010496a91.12.1793602488660;
        Sun, 01 Nov 2026 22:54:48 -0800 (PST)
Received: from hu-sivagupt-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9bc6f7sm16841542a91.16.2026.11.01.22.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:54:48 -0800 (PST)
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
Subject: Re: [PATCH v2 0/3] Commonize Glymur regulator settings for fixed
 rails
From: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
In-Reply-To: <20261030-topic-sip_cob-v2-0-159e29e97c82@oss.qualcomm.com>
References: <20261030-topic-sip_cob-v2-0-159e29e97c82@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 12:24:42 +0530
Message-Id: <179360248274.1904790.6967545590442532579.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793602483; l=98;
 i=sivansh.gupta@oss.qualcomm.com; s=20261009; h=from:subject:message-id;
 bh=fzaE2019/1jd2vdupDOK/Bc+lldi9kzFZLW3431ayms=;
 b=GVogEOzbzSqV6k6efdAiLgJXUZPD4HLzsIOtE+xD9rCKWwCF5FHLsim/19Mitz+mgNC1eYZsq
 Dk75Yk9ZonKC9zImHFfCj3+dU58iSbN875U5y+yXTt7TcK1tik6QOe2
X-Developer-Key: i=sivansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=FlECOaX69DTzzKU8Gkt1zsAy0qNbAjbWuX+HULfCv/Q=
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae833ba cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=JkjcV45McEFikerTOJAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyNyBTYWx0ZWRfX5RpQst5pyTJ8
 VAXvpNHfhYapyyqePMcy7JeISikZzzzX6Yg06HaLowCLel6U/arNTfhOdmY54GJcj4OmIUHzvdX
 hZQBrpE2NjSvYTowaMAQyWNlghhil7nXg2JwbkZn9rM4WfWte0vfZC8BJ/emvB22CcC99JW/fM/
 xjzxKx6It5HBMkBoQqeD8ZFBoXystk07ER3sClqOs00e4rP1P+oa8rsvGmzPl+ZQcyf3cX+V+hG
 mqGia3KOkkzWZcEA5cvw7dgtXlJlz9Zfle3IC11GW/1804qABumvNoNIG11xJim52p1J9hMbQ51
 4MVwALE9GOlgpZcLMuRRUSuYLi1QMOpTzTWqSse2IwbrKt/yhdX3ngsItR7qLJbwZql8oLo/h0B
 oFhzNOLdcVKzezm6NE3f6Bqr4qDEuRX5XIYmietbGrWOzeKLdOmfBJDBCyoX85N0ba1+T0+TW6/
 eVM+cAyNMlHY1t46CHw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyNyBTYWx0ZWRfX/YVByXi0VB/F
 mU8UXlNb4xmx1EXw05XWsbjdDkXrGJmGvNVX3HmJH0qPgapHS3P1jalHbAoiC/snk4u7fWNmLQc
 w76CGG3TZSf2K2cs761dosZZAx+axnM=
X-Proofpoint-ORIG-GUID: SoDPkJHAYNn13Zl_IHKN17Wst9s0bPD9
X-Proofpoint-GUID: SoDPkJHAYNn13Zl_IHKN17Wst9s0bPD9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020027

Tested on Glymur QCB and Mahua QCB.

Tested-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>

