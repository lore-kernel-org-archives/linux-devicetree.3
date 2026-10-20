Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485227;
	b=BmF6iC1Ne3QMZAgMIANEAzNCAkoyJq4jg/tG+rutE+KCo2whrzJN1wopTNS10sHIiNZl
	 TcSw2cIMjiG5NxuGBMsvSQntwmHH2QwgfqdhatYErHBoEHPO2rE09Zco7Hh6+aQSxEplK
	 yYCS+kpEPcJYVMtKzFpQq5zF9UiD1/M84E+Q+M8VX3Rbx6+54UYUMbmXrwpFvYttLwUHq
	 6XZLsPIlfixY6N5gfBfd2CQkQVhxYsUFymQ6r20qmiCNVWVVS4exBzmgv0eLc2kjEwAsU
	 FTlmo29g5I6RxyE9m4JctiJMg5xYL4EIWWYy92c7DGYPV9otHHSrewF3wFzwY2I5INA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485227;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=p66OhLIDCBcG9nHMSWG1cULPATR7vDMq3ytT8TFvDbw=;
	b=Xanif9LLsqVPzyqGfeE3EJTs0AB3G6f3IZ/faFO/QQHM2gGFV8qrP0tHqC9C2sTjN1RG
	 go3JIWVcOHlUwY+qjM9NeuA+bgWEmhXRM2AQID5aEcNG9IWthS5PZuGSkQw52gaxmwa0J
	 IsKbKYhH6GhYOOGOJYbdWXDA1na6/NPswiX+9XlOidrpUbl57I3MlBiYFQWLy0JLaPc0Y
	 JGinpRndIoZBVJfgK2z0IWyRKBQ0tYOrNY5lbVREf6z164c1bR7YzuvGdpYu+4tfgNFfq
	 nglvSk1SbMzQHKjuorD6v7pjZubDUyq9rYNRdQStv5coXR8Wv7in4C8tuVnq33uxgUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Vf5/NbzF";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SMIXbAdL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56844606A31C
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56844606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vf5/NbzF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SMIXbAdL
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8TjBw620321
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p66OhLIDCBcG9nHMSWG1cULPATR7vDMq3ytT8TFvDbw=; b=Vf5/NbzFckgIDw9m
	VsqvR3HDMlTjgkw7l0VUPY9u4e5S13jBuNjqRxzdCzhAtqSC9gKLyhfGqx633Yur
	BS9opZcTtSpFIHiw7Dn2mcALKsdmfc4MXGqYNpio+zTi5v3dicw5UvE2Un2SlQtP
	gSgsItsKlqACFEPDFt5m5j898YxsY5jOWqkWYyKD9jMC08AvLiLXbLqAM/dkLXj7
	+vx1twhvhv28KrB/Yzbu1Ly29bB2Dud2PWUDx/qa3J9sUzcoli1yo3KQCt8lRcAg
	1K2AjWLG/mariazX6pOvjA9nh5IqnT3sr0KrveXsU/3vw14MXxEPut5DRciObH6m
	bif9Rg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nsk51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:33:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1f1f2ecfso96252285a.3
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 01:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792485225; x=1793090025; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p66OhLIDCBcG9nHMSWG1cULPATR7vDMq3ytT8TFvDbw=;
        b=SMIXbAdLQScYaVkg5e34wX7g4KRK4iDjnBcbbYWc1ZKO4iHM2Qw2v9YQ0mXPcCdEgT
         PpMpyaB79k9RYSxrBN8rYTWqJ4p9W2pgGffRH8ipGp3G6uY3omdeMgx8wQMHN/vhHoJz
         cKrZIGeEckfPZaA+FWvdydLQRNJSpfT/0W+W94hGtQvMWRH5sY2X+MeKw9LhNca44RXI
         aW9ZJ2jLzZnVW2sUceUXu04TkRPMEK3/CyaC3vjNPexNx4sbuotRzPSczlGB1lxtxFNw
         Yu2EPZdSREWSOwZpqBmFhw171sVEncivWQpcbz4/8eIG4AKzQ5JO31RsSt1mOqtuFDkn
         NeIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792485225; x=1793090025;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p66OhLIDCBcG9nHMSWG1cULPATR7vDMq3ytT8TFvDbw=;
        b=CzNh0VQklUk2rgnQfKEQRdG95hCHMw6pGq9z1eGsYlquQ2HRwdU8Ek+Wcu/x4NyBTo
         CC77DZ6I7zt37aGqhlfZr+XQWhswC/0m4wFeTg6QhRkN/e8IrLqIlppPfbNhc+HQCdLQ
         v5707CEkR3emDQuuwz1DpTnnX4NZAq6gC6lwFbVXFy/tyKWvheh7kyL5YIETrkv+XBd1
         owkdn4Zam2M0GXiXMVzHteJ6aR9spazsA3vqxmFOcZoDUa4CUltj+tX8iJP6I82BPQGI
         0OlNuypZ9Efq0Dl9bUA0i1nss+On7k4SKCIpaQdQ+xxiT6joBAS6xLpH3tFEMJaXyXPE
         krjQ==
X-Forwarded-Encrypted: i=1; AKwUvBztyjJ6j9t2ZkVwIxRH4HF8sNkyDBWWAR0/OMMp23DKnAMaxTeSLKbWkLVRc9DCBi4rzDDBKD07PNd2@vger.kernel.org
X-Gm-Message-State: AFq9FYLEp+XVJvjOkBELuTDXOUcto0/esEF1Fr/jvufJw3KTUldaGuLT
	Z/tMBbTCiG7UJGpjwgsTi1tAqGhYYrsM8uF+xE4x2FiVnqj1yx7ygOHK+GrWJr4kxE9qMzkFeQ3
	O7fiHw91zsd/clbEZh04Ey+IjTjSYEOY+X9nMd0bj3RhGB/bUzMXP6gNuWm4BgA9i
X-Gm-Gg: AYBFou3OBADQd4zhmM4bCFXwyXYCFbJm6Z2nfe+IfnFiG22jMlXkIF93bZOrlo6VVi6
	vlMRJEZA6/DME5GGQS3l6s5DEMLv1OetfjellGmDYyYjAYnphznSU3P9lmMuRDqtEmmRxeEHGs0
	GZ4GDWEunfYeqKCjtr6vgQYQq3giILJn8VknDQU0/R5PFWOB1CPj8sVvngyks/Ok7KGkdMRsOVu
	0A2kur3vQBuXKhmLaVdL2RuuUhmQoPrCauJG2wm6dlj4iuYkznUTo92cCjNURP4f9jrx3KBrJWQ
	1ANdFLGMVaqKjAxOH2xKik82QBdfDVSdPZ2tA18Gnj3ljmnQ5TrGvqv7g1r1GsrxvvaEw9LTwCe
	0ZNQfxmwHYCJzH3UqUvmsxw==
X-Received: by 2002:a05:620a:7086:b0:93e:e111:2771 with SMTP id af79cd13be357-93f29beee37mr1876096785a.2.1792485224622;
        Tue, 20 Oct 2026 01:33:44 -0700 (PDT)
X-Received: by 2002:a05:620a:7086:b0:93e:e111:2771 with SMTP id af79cd13be357-93f29beee37mr1876094585a.2.1792485224147;
        Tue, 20 Oct 2026 01:33:44 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dcf123sm456787166b.14.2026.10.20.01.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:33:43 -0700 (PDT)
Message-ID: <da0ec4b6-db66-4419-adc2-9600d8cc5793@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:33:39 +0200
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
Subject: Re: [PATCH 04/10] clk: qcom: clk-rcg2: forward the gfx3d rate request
 to the parent
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-4-370949e4d8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-4-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMyBTYWx0ZWRfX6+U3NCdB4X5V
 DUZDu5IsqWA1TzEvk1msmgREU28o5lCaYZhR5zPhaa3biUYKrQVbw1GoFtv++ci9V3yYUijdPuo
 7qPlmsdiqHURkOuJQ+ERoxBAA+p4c7U=
X-Proofpoint-GUID: oDxD2mdoC-lsg5u4Z2f6ftZurGOqdzTf
X-Proofpoint-ORIG-GUID: oDxD2mdoC-lsg5u4Z2f6ftZurGOqdzTf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMyBTYWx0ZWRfXxrIt6a1ZxOer
 dSTTkPfwEFdq8ZdO2JD7BR0CN19iMVztZS2kXD44FMzwSQsHK/UT/DSMouVEGy2JiwWxXdyP5S8
 TbHudbpoHJqmHi9Ca32OM7G42Ov4B2tvw5gk9cD/0gn+oafCY9hb7xvPwxLhxPE65Q00UjTgw4b
 F55wjv8HbQtHVqwMIWMyVbxcj8EyW3Y/3AGDx0wB9VNTF7UlnPLfAcVkxeXAtKHKNI3bmhoNMmY
 tPd8Efm8tSGDSy2n09pQnF32B3c2YbCPETVn5/B5zK9APtNPWsJnz5JdsVbzfb8u/vCepxBNO/z
 H1Lf1dJ6zFuGd6B5kutOLLKrcjz2mJHNIz6Vp1OO4Iz8QzmbdvHOzwgE5VcFIbEYbjSy/6+REs4
 TCL+YEJdKiKXIxi2zKc4la3eKiv9Evb+FDl5vrmZtqzueUbTiIeuEkN6vHMdE1tNnS3evS0mvmS
 fkxQjkgBcV3CR9hGHiw==
X-Authority-Analysis: v=2.4 cv=TcsDJhQh c=1 sm=1 tr=0 ts=6ad72769 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=RaLkOdssimeRB-vWfmoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200033

On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> GPU DVFS on SDM660 never changed the GFX3D rate. clk_gfx3d_determine_rate()
> builds the parent request by hand and leaves best_parent_rate at zero, so
> the PLL is asked to determine a rate for a zero parent rate and the new
> rate is dropped on the floor.
> 
> Use clk_hw_forward_rate_request(), which fills in the parent's limits and
> rate the way the core expects them.
> 
> Fixes: af1e62f2ffe2 ("clk: qcom: clk-rcg2: Take clock boundaries into consideration for gfx3d")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
