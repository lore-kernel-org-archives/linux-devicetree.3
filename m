Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CB83451D9
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 04:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783400183; cv=none; b=mJcAtOAx9dGVdfOV9tnmhTLgjat83IlIOSju/BVB4FjOMOZMUaZiuprUKAyx7j+BpNE5/A3mKgAa+qkd1uK+ZhBxMcC0QUDUsgMfJnu8uyhdH6mDvOcTZUabr2lTaKCtJlbuqdx7OHl5t8XkxSsvMBlfYTpAXjU/d1VLlbK/88s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783400183; c=relaxed/simple;
	bh=AJ53eWkj8JoeZLOZEeHTwTI/FEoqLL+HtmJAUY5Ecfk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t0MwzEcpHZxkJV0xg5gVVqlVWIYvl0XJF2uwiYNaKQczd7tK7wb2yrvRn+oMIFJ5GISjZ5TrrydfGpowztlyvhaIcrCiYvbViQQaRC9lsGneYckCfnlrZkrpqcc9o0L01fX1xietCRYx3UJ3n2Jnkba7DFFlTOF1XhTdNU+sIpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qewgf9s4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a+QOqDHW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qewgf9s4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a+QOqDHW"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748s9G2629796
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 04:56:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vFkX7LQlNsLH1cm6XsRmdX4en8xgjchX4ne5F1lnKis=; b=Qewgf9s4jd2wuv4N
	TzmobBV5k1e9udwUBzL6rJlrUGLTMewp7aXAmkzkzTVpgyOipzqBIMJLASrAjfQo
	/uwUR3nRvZ3PeSJvn7Sd+dxEjOVrF61G+xD0AzjogMPFdnihrDFjBxB7Vi9HN0pb
	enHSZ1UyZmX17BAF0HR6z0uoKZxCgMO8oyxxqvLhcZH58r5mw9MlB/6qGlpS2QbQ
	ENg2nohR0P38cbBBg5yX1qmeszF/EMjHkNZ3mZa6NVbVL6c8Qz5HaiTGjd3G/QtF
	hV38EHpd7QHWwM4mo/LR0uTfnTH6IYiUNEzpFX7KpcjlTaF4dtrj+F21V7LQOswc
	4jlrcA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h54j0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 04:56:21 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-847ad67cc51so3918125b3a.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 21:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783400180; x=1784004980; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vFkX7LQlNsLH1cm6XsRmdX4en8xgjchX4ne5F1lnKis=;
        b=a+QOqDHW1dZbuzH1ihv0oNU5X+ccX+CG7oVEmF9nj1sZUxAkjhi/R2XXh4+4O2k0Me
         biQh528+RAHED36vzWyPqzrw3VklqQ1Qxfh2wS/WBzIaYo8NUtiaSAzUBws0+bqvdaDa
         gJxlGzv7Y0BEmFq2xfIAPRzUE3K/y14E2pMBRiTVL1XTCgcOiFUcUe0TRp9eMoR8NuQK
         iLMVLmB0K5V4boIiWKdDgP/RQTO1p1O4HUU3UcXUCuETkJyGAiAg67m991Fvi5fXFOtj
         Ok9ConYDHzYjqkB5mu6lCi79siHEAT8P3ZUVUnJhrt7pRsBcrV5SAJx6EI4nx62IFOuh
         CwLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783400180; x=1784004980;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vFkX7LQlNsLH1cm6XsRmdX4en8xgjchX4ne5F1lnKis=;
        b=E4SpLn98ojZi0U0+jZVyzcnYUGozCbfPC37h91xVIdF9G/QDvtwjKplXPH4zVZ5i/0
         eMSqOOWjVOfZ71Gc7BxYsyltaC1+Pf2fpdNnt3l6/0cpjIoGhI0zFC5nQB2nZDK02w/c
         i7od3FnMiY1hs623AOVNlCXJMmAMNq3wNp4QlNQ6ww9L86ASz7oRB49Q8ao558OEbUWY
         HLUYVO2L5FltCDr08qB1F9jK9IEwVReX4wmYxZSEmnj42MJQIAAjL1z4MLCfcNpPJPhz
         GG4qXaHkU3qHXHyn4gURJAVK50oBpa1hEJ0HQtWHgtJCADKBL5RcdYbgPrcUIZh0f+1E
         kaQQ==
X-Forwarded-Encrypted: i=1; AHgh+RoAUTnY8hJZvOxak+agP1uOGx/NT9Zvmrj3JWoJDPAtrrknNVmBUq9GfWdeZpOcJv+ScMKTNpgLEXFg@vger.kernel.org
X-Gm-Message-State: AOJu0YxA/rJBUjm2BjPz+XgNngVjY7K8AVU2tO6SBDKWZ3fYoWjvliEz
	2QiHukcFJVTZyyEbZ4oAF6vZ9uQZGZ1w0xoJ+HiUokoTJ6GmVXbV1BghY9r/hoD+pw8TvfBUiFX
	bigfdO1Zh1iOV31MPAsBdar6vQ6wEDxtwvdR6nj9KkbimQuB/WCN2Mbt+NCgDKUqQ
X-Gm-Gg: AfdE7cnIwf5nqOYwqbJ/Bw5foEb40AlpIyZ2D5ynGo1UqI+2M5xm/NKZUPo6bWN2cpv
	fKuXHCgZBAFff/VFOyJkFZ4Ojy9LYDF5uZyTpXQaoABDpSapJG/WvNP/7RO0oax4hXNdYp9bFH+
	5e50nPKYtAdKbkKRf6Qdxq41VtGI71kko1tyI4vsSlFfVJM6qgUFPncAiXirt+0D4XN4DLA81n1
	xiwJF1NnOi+9v51aSNGwLASFUevwMrLtWsZ53zbgBl4zuoINbr93/Y9Shs/FJnL0TFl2AlFCsFu
	s6b6agX75wRUFvweVf3sFC7xxepox1x4Y6+tXR2rYw4mflhk7jStZuG+ePJkaVE2XeMsmqqefeF
	kuO4zzBVh8Auz3QG/1vg4V0y+/uHYKJ4hr2QzYtk=
X-Received: by 2002:a05:6a00:8d5:b0:845:eb88:3d74 with SMTP id d2e1a72fcca58-84826df139cmr3337860b3a.29.1783400180278;
        Mon, 06 Jul 2026 21:56:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:8d5:b0:845:eb88:3d74 with SMTP id d2e1a72fcca58-84826df139cmr3337828b3a.29.1783400179800;
        Mon, 06 Jul 2026 21:56:19 -0700 (PDT)
Received: from [10.217.216.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8482b333d4fsm614686b3a.54.2026.07.06.21.56.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 21:56:19 -0700 (PDT)
Message-ID: <7333fb05-2a9d-44cb-a548-c8d2c26c1a3a@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 10:26:11 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] clk: qcom: Add Nord display clock controller support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
 <20260623-nords_mm_v1-v1-4-860c84539804@oss.qualcomm.com>
 <4c8d6b13-6cab-4731-b3af-bb83de9d159f@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <4c8d6b13-6cab-4731-b3af-bb83de9d159f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pMe93nAk2TKfEMD09OqojJLdpNXBk9xs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA0MyBTYWx0ZWRfX0qw1kSFUYERX
 jIfogEjKrD4oUjTCbIEexep2CSaN+NdalyUfZXGPEgrlsnwn8uD9OzlYZlcBMXtLUXWN22IFdh0
 WVbBo/9FCB7lEMZ8Q+tAwp5NslJWlvU=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4c86f5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=_JUvI7eCtL_LupWHxwgA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA0MyBTYWx0ZWRfXwjXKY8TO3w21
 0iFkj+5n4UHNZRAdDur4yTS7K7ZQnr7EpPmilkECKnayk8be6zJ3gGxDAF5tjDpmV/XcXuF2boT
 EaCJm3sFjionFiCq4Fg/W9sv5BxEly9CGUmpt6OHwQVNcUu5S4GEy3ogqTybTpM8XpTsPuydL7k
 cHIdEq7mFjUrZFLFaDbZG7UoLN9rJ6GkGkSki9utougSRfXp7HwtAkhTj4Orm/jkLbLjvEiUAYy
 X14xCNVlAo8eMgYt9SHDHP9TmiuzZW7gzoRGVhKcp8Hz98ai4WqghNj9dUdmETXemJvVvDqjIUl
 PFRlnv0/5ZvET7DSqcVi2WpkerdKkLnyD1SGwrqA7SRkr+DM6E/WG6Ba2TphObqJf6CQmGWXEkN
 TzvMMni6tnVU4P5Th227Zu/bfiqYi1Uci2bnzulRw0Y0xB1c6GXOq4tGM6sskEp54b7B6WJ5kf0
 j359/dc7YDy2CJdZ2MQ==
X-Proofpoint-ORIG-GUID: pMe93nAk2TKfEMD09OqojJLdpNXBk9xs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070043



On 6/25/2026 5:36 PM, Konrad Dybcio wrote:
>> +	DT_BI_TCXO_AO,
> This one can probably be removed, both files


I was reusing the bindings of SM8550 and thus kept it to align.

-- 
Thanks,
Taniya Das

