Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591235;
	b=vhoCdp+9O2l5A86hogqPnAnWIagr4BR766Tm2wBHhnzFX+mOf8zJ22dSTdVLM/InyIUg
	 Nh/jEbL/wy97hTuYgDsh1cgmJXOhbTpFi5P2/eHAWL3dD31feZVyllweuL61Z4Em/SxHn
	 sKRm9JZ75L4AjHKb2M81Pdlos7Rc0Bf3jB16VhZy3fP3oHiyyrr4z/1QfyvHiwHc4BIKM
	 OzPS6ErA5SqKCjkk6xtSkBGWuHLxNIIJSBHB3qiEGB8wr5EVaMD/N8iVqpjHYInRNjzWa
	 akh/Cb/WMuaNJPYfrqxZIKJt+740+aCx1r+B+7PiGbiqvq1DYXbeSpO/e/WEugg/xYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591235;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+3tXMKH1cZEB1OAWwRarq301e8JF9qJ8xcXAxkIXA90=;
	b=nYYGwt8ts7K1pVNb43LLpOAeve14LFQGXTl3b+hwP1kwMxOgVlrYN0uihET76n4Ywl2S
	 jPiAE2zw9wNLJ7XG48SwREmAL7bptm/Pvm6trjYzwqwAFaUekZ7hVa3+x6VDxPg1mHmQD
	 iSvZKY+k2Povue2IpzGKFovvfrzP9BLtVVrfO5NAORDOWyRXy1Xv8RoXTG1ic8InFRFUr
	 Hv93KfHgQo/woN1wgY5h/ZM2FIvuSjfznnRv/ZA7hxNNO74ig9AkgkrSQH642TbVSnSFE
	 IWwqvNhNZuKl7scvPTNl1hehROYTpnkIf9IvX0/WPG00VtS1YxzI9DFRpEezzVaFdoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=anFs3Ywu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j0eAl7QF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECA9606A32D
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:00:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ECA9606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=anFs3Ywu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j0eAl7QF
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg4JY977387
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:00:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+3tXMKH1cZEB1OAWwRarq301e8JF9qJ8xcXAxkIXA90=; b=anFs3YwuuX1o37vW
	4zYwv5s5aGMgXz8XlFBBMG+cu/YjA00QUe6oESLTHCOM1WL0EfNjYPu/OCUcz20L
	woYdt0/5SoOV92XMti0q0YpmZPOl5UEeGCQ0zuUYY9r65N+MVWh6Gm7AKqU/LmdA
	xBQ0L6lxlHw3+1nSiTk+vmylMLLa/WD9kZRa/FxpC+U4mIVl179fBN5Dxccz6hOp
	5pfqk5yB49HeeXBBo6RhTMZkaq2QnELVvhaduiN2hLykk2eQK4g/qWh/vQuNHYDM
	l/5tPvo+59rV1uX4nzAUDK+UPxqStx4APjpKYhbdDH3Fl3JTb0kLRoORSHBLUiB5
	L/utcg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs03fmr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:00:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1f1f2ecfso20887285a.3
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792591232; x=1793196032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+3tXMKH1cZEB1OAWwRarq301e8JF9qJ8xcXAxkIXA90=;
        b=j0eAl7QFH6EX6WwybQGVvQ8aWejWPEkWTPgEPjW/na73mUF/JDcmOAWouTxEihVADB
         /jABNyPyXLIQHTCab0KpCXQuHv8qWtRIjLkXy2+gkmmEltnrqDz9Cecba/vlQ3nrV4Kt
         8bWUdpbIXFhNP8F1oHZ7g0foxu8BjQ/oWvecGAqOPzxtH1oApiALYt2sphu/e0dzjYhF
         ALNKN90sOEmPUv8q6025z/WOL9YzlmV79384EthNwoWmcpKFU2TAomXZJL3U7xn0WoyK
         V43BetmH3rBFShhA4ihivZk3+nwQuvxDQwjW/+8mPGlfTE+wOZ2TtMf1QYCQh4ccgK7K
         S6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792591232; x=1793196032;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+3tXMKH1cZEB1OAWwRarq301e8JF9qJ8xcXAxkIXA90=;
        b=H67vkoomA8x+T2jbJAEbqPrKW1r/kEY2lgI9jGZ43QBW9rBLGy3pEXv658z3XPMUJ3
         jcyuW+waYAlR3liRaYvRH0O4brnL4hsRB1L/8JWwHLYv99S7HpLHKEBiOJ7+lVPZ4OpT
         oOvpeevuxxlT1lqA/3hY+Je67UdGEmRdnZRmgWuz1D5B0jr1pgt6iyL+bbLbat0ry3az
         NiCZoUCSPMjJqBJxKlCekZXtwRvp/J6tviFJMsj/rtxn+vpVdSYbaEIdlABK/i/4PtH4
         u1By6jy1CysWSEUyGbKmD59asPZcjZsdIZ7IS7BgV+rYlWXBTevR2FC/iaIEW9StQi54
         bBmw==
X-Forwarded-Encrypted: i=1; AKwUvByB+djRcMCZD0IyHa6AyzoupDsh/vVkhXb8Yq1Keg2Jd4f4MoH5pE6qkBs0D8AiJVLRb5Dmcsn0pILW@vger.kernel.org
X-Gm-Message-State: AFq9FYK2E/W+x8sjR+0FXfTxxwVimIMJoRJKoEv2m5lmg9uD6My8rD6S
	KfHLAcKNRi8UqsA8mfSv/7L9lxfd0NaryiZO0vlSsrC1VK6kQyT9j4kzggyL9RuwPV7En5J92lo
	Aox9JnWxCBsOAOaHjVVtYxVQndIlLoMgHLrXqTwbo4nfRzsnmG/vtDVWnvOtamKks
X-Gm-Gg: AYBFou1Um7dkCluxU3fFsYhlC5mrSQagIr8buI4St8KFDkPKVuZLbeHhNwspTdEV649
	zVpZ7NF0UCR5gFUNamO9IpEXacIx7HE6J9jpLv6s+7BqG0kxCdmtR8Rv5XwYSVYeHqxOFOYFBoQ
	2Vdh0dG2BTf40RgM/o9sRJ7Igo8oqjTCJ5SzgKmcuA4/0co1v6gC7q/KmjFOlerb1tS2S2LtOwf
	pcno5n8a6dbgZqa5t9SPfOUsLa10/5hY2q2fRt4/OlHG2AUrs+7dhLFlufo8yS/tiCGEE+9hgRl
	So6FAibl60pSvrzf1/hr5q+rA4AvD2wyLlgAvOd55wZVtvBzsEwjI+VMDNdC8tfx+u3A/GxRPSc
	ljmSTYpQAa9edfHUf+g+WxA==
X-Received: by 2002:a05:620a:480a:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f57f87853mr518088385a.6.1792591231194;
        Wed, 21 Oct 2026 07:00:31 -0700 (PDT)
X-Received: by 2002:a05:620a:480a:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f57f87853mr518034985a.6.1792591228650;
        Wed, 21 Oct 2026 07:00:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a4ffcc5sm7861166b.26.2026.10.21.07.00.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 07:00:27 -0700 (PDT)
Message-ID: <33d4d460-684b-4031-be45-3768e8d6c092@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 16:00:23 +0200
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
Subject: Re: [PATCH v21 12/14] arm64: dts: qcom: kaanapali: Add CCI controller
 nodes
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
 <20261011-kaanapali-camss-v21-12-04fd28d815c6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261011-kaanapali-camss-v21-12-04fd28d815c6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad8c581 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=RPG6soaBvYURGeOPBHsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX29E0t1j4oQi+
 OOdSP+ZCZx0cZ8cwVf6t8p+w3aWQ1t1cCv+3ZR+X81Vz1I3gKUtrCU2z30RV2VXznPgMXLzvGpg
 77AcicmGaktkrnGwEmQaukVhizxyjFSfS1WjqaH2/DMJ7dtnf6zNJnPZQ75oUJjvNEKTNpXcKK9
 beKCL/+k8T0MFlRA7eJT2MTDS1tkKdI0Bm2qoyn5appDFKK2ZJYYvhokhrlBKTg7YmH/E1U5nte
 BzbkNPso5WZFFKqNA8ElMNdVheVW2OU87kRS6CntLRgtkNtnglw4epQBdzLFSuVNZ2kKa4aIfCb
 z27tlXfVvZcSGs8xqH3BBPA9aKjzfOruS39tgzPGTy+EXyjt8yXJqyNlFXXwsxwkXzQH2VYWGNb
 BmJ2aPYjAyWzMLDzFlkVJby63FkPO3WKUwzbZGh1/R07B8z6Y2k62ml24wCGuAMPjNggZAMmSC3
 dWo/g6saQnuFX7t9LEw==
X-Proofpoint-ORIG-GUID: yTdSDGvLziHg_Z_su-fS3ZqWR1O2dI0i
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX8vFyfGy/sMqb
 bQcERMcaBdVjeLvK8Hb+2GAZwP3+xJc31MmpMRMHmNlovR8xqjYnGM13QQYah8fxgaOWhSR5vFJ
 2twI2dWEdsfWXjRplwSyV9d/dfmgRBA=
X-Proofpoint-GUID: yTdSDGvLziHg_Z_su-fS3ZqWR1O2dI0i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210055

On 10/12/26 8:45 AM, Hangxiang Ma wrote:
> Add the three Camera Control Interface (CCI) controllers present on the
> Kaanapali SoC. Each controller provides two I2C hosts used for camera
> sensor control, so define the controller nodes and their pinctrl states.

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
