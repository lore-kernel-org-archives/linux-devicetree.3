Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479349;
	b=bUJm8Zb+lSueUfgHAi1/W5JHVhOgzglayV3YWTTdxY2YuAoGV4+YPzbWRPZXu2pxtz0j
	 r1sbN4TbkC1GSv5nfARiJUPZjizJUZQ9FZVxTJ+dmTIxTQfm8LW2O8ILybIFr2jQPKT7I
	 DNKou9aaP4ooLzBaapwcgjpNFhohP1F2s3vCp4+x0Uvt3pEj3H6Ik73Ul3CNhEH74Dc/t
	 rYkPlupYLV8hVCm4zMOVHLoRvNqxuQReJSjIMDVarpt61vf7pW99XZ7KOH3mLmCq7am+J
	 dsuJSXYkgcdInvoyuTnw+hylcmdl1OCLWDlejjyqPt/1fRPASI1Eye+cphGNNxWYl4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479349;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OTo02d9lu2hUCUXtfOqHtxSGEa5kW4yvDS/CVW9TPHs=;
	b=Oeft7Av8BloNbsNdVgAl+DUCsxgjHnjzw8oppf8UtLfEGMIIFH6Iojt6eoxz1bvnbSAX
	 vUOmQ2eXWV7uKvMKhOhrRY83N7JMTvdTY2S/m6LeZjYWEHGrjUY51jHX9nkDyDSv3KTIA
	 6rQsKyyV4hUkvSW5qKv8up0d9KWrmZ5Cmb140RlkSXpB6GCCJQmFUbKLSgVVvDDS8j10X
	 cwO6L/KEiTnP4Wsy0Sspze4YD8LM/hfoVPtKoVDj6DBE+6P5Z7I9ItkrEB4aB06s7RIk9
	 M2pxOsUo0jDYcWEKFXYEMqqNaHxfyR+R4KyhHngWXRZyxtkEfDSXI4GysZPnAaJs+CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eOXZ77JO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GN94tP+b;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B83606A31D
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8B83606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eOXZ77JO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GN94tP+b
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tIc43305673
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:55:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OTo02d9lu2hUCUXtfOqHtxSGEa5kW4yvDS/CVW9TPHs=; b=eOXZ77JOS+5qBwf8
	yoW8ccNz6u9NkcR7Ur48gQYnAw6ikuD/RzudVJG5cw9DQmva1MIcE1ziZzmp3XWq
	uBW+/fy8zDWIE9W7y1oPJMv9RwcUCD6UEmd0bz4cbWAv5gBw6XvgemJNgy17z+y/
	y8hwmsT/nHyt3EydGpXFXzgrjbg58hV9ICuRqW3ifduW/gGaaljN/dOXidJiXNKv
	pyIg68slO3S+tYxc01vAbjRpRmkPZxY5D4oCvU2o3dtTxz6td1bAOH/LF/f/WuAH
	Tp5A/fj3W2Ae5/YLvJK7Gfu6nIx2zbRf59hKDkiW26bKWiXEY94Ce+mRVOen0GzY
	6eV1BA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5ss7v9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:55:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53568f05f8bso9158021cf.3
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 23:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792479347; x=1793084147; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OTo02d9lu2hUCUXtfOqHtxSGEa5kW4yvDS/CVW9TPHs=;
        b=GN94tP+bZHBnT3KXoZRkN7W0lt/V33IcJxiDEUjRt4LpIpb+VqBm1bjcyomlAh8wpf
         PtRNEaOuCHWW1r0gdsfOtWAvU9H6oCNetbV3pgHmKOKg1nnB9SGAfb5jA4u4ZsN/TZko
         Rx/l62hmkGXZuF9FDQZOhHnRch5mOxEFHE6sKlAKapXSUf2YuqOneDukIELehFmudWWt
         cGjClQu3bF+CM5+PAiE69q8wcilEGv/Qv9fkuNqJEMz+u8Q8b455sVD/mb2OKLG8YFBF
         VFnwKRp7hTTI0wqzqFKLm++0I76XpvEKwPHYnpgLDNP2/lAN5rFvJvFwXhIsDby6nLoN
         ovZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792479347; x=1793084147;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OTo02d9lu2hUCUXtfOqHtxSGEa5kW4yvDS/CVW9TPHs=;
        b=JjP0KB5BBwTSPnxIvVouA3x35D49km53tfLTIBmeAU7oON14b2JbwrF8qsE75YjSi5
         aad7zWG/LYMwyqzHUHLhb2f5himDc7TEIsIFUSMoh4Oi+5Va0dNzxSAYcqrpaEFtVLDU
         9rx4LIvTqxtZ+3p4vjSVIofCiedzHsKAjRPmWk9ioTMr5nPuq6zrOSOUiVGzOPOAf6Ms
         a1QTnuWDHatKYE4k0Qmy6E78OQg+pMTZ5hOzU2QwV1Xnyf1+Qe+6Ez57lHr4k/JX7qmy
         O/ceJbvnrYb2XFXY6gj1wdOCTmNQ/tZZTWUVu/wBrgTwv7w4yAgQaXOVXWILpiJJYG+3
         NXRg==
X-Forwarded-Encrypted: i=1; AKwUvBwz+5MZiWE70UN0rtZGM8UMxW/mZDPzuE5xobmGdefLppWs8gsxxKZqHnZO1NG0aHLat3QYTnXFRFsJ@vger.kernel.org
X-Gm-Message-State: AFq9FYJoY8KdAfUbs1Yz5iklO6+dsMSDdzDPAudawqiRgEoFlZBfDRlc
	w/ukHTRAmTANCOlpfSIwzPcK8S2BLITYDY2l4EN2kNNLAKzqU4sBumN6Tn+pHPgvGWeb/hx6Grf
	E6GNv6OhjyRp3VhcWuSgu4e0gN13JX9u6Aabok1+7snF8CEhCt8j1Fr46qXumyHOC
X-Gm-Gg: AYBFou2D+zSkYERG/hTIlXdvzd7el1RFVui6YsrWG8lU53CujQQfcQwZinGKrY3fhmg
	uTgpKtoMAPULo0z0FDWVtGttsuPXLERHbPX85wlJkuuEL4BpJLh+k6Nj+gxjZsyEMS5D1uQmIP4
	sjcsIp9zjsEopbA0qM+slRn/cYvcTBuvKcz9WaY0prTZyKf4453uA2D1dQf0gnqt3TPxY6D34/s
	/fYK51lyKzl2w0JrJgH9ZmOFXQ1BTp3k9VpWTWr68EFRSeLhIMXEEH0pNZadPXC5s+BTTznUPLq
	yQqyXi8iDc2ghYkb6n59bt2Ga2xxlgf8ABhkc4LOPa5/QOkQi43E2aDAgyzJxk+4czWPwWQhQgG
	PhZj19n2wUTPpDxRu+KH0Qw==
X-Received: by 2002:a05:622a:14cb:b0:51c:2324:666 with SMTP id d75a77b69052e-536460e29afmr169672891cf.3.1792479347245;
        Mon, 19 Oct 2026 23:55:47 -0700 (PDT)
X-Received: by 2002:a05:622a:14cb:b0:51c:2324:666 with SMTP id d75a77b69052e-536460e29afmr169672411cf.3.1792479346744;
        Mon, 19 Oct 2026 23:55:46 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eae235sm462296566b.67.2026.10.19.23.55.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:55:45 -0700 (PDT)
Message-ID: <4df039eb-f89d-4a82-9f2a-dc90e31548d8@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:55:42 +0200
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
Subject: Re: [PATCH 10/10] arm64: dts: qcom: msm8996pro: use the MSM8996 Pro
 CPU clock compatible
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
 <20261019-msm8998-fix-clocks-v1-10-370949e4d8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-10-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfX8m8nH6ggNu6i
 gvmvjjc4you+DulrlLT5fOQzahtoM23tKQrDso8+3CFAZUnpUknOAtefQuPvSATLfK/P5J1g+Dj
 ZLxDRf0WDZoNYi7jiwbdM71h1/li4P5kRnC42Dtb+Fxux4bC71Mj+6xWe3N52DBzgXBZ8qJq0MG
 ypBp2WwaWkg1Ouee/HxYzdD34ndPr8KN67e+wDV9EiufC9ftDhIw3j0uVtdjw5cMtmmtswr0wpt
 rpiudVha6DLbpg1bcteFyyrtvgf7dzZL3RnNAetDBirz3sXC+0VJc7gTLgl5v/bt9Drs+vo8/2p
 jJbMFs+rQr6JzaXi1KOUdcnKwdICVkEdoyo+LB92fyhd2P7gEhe0uhwpSuFTcJOyv4HCuFmu2j4
 u+bbBALgf3cOy+g00sJAR67gbdX3sbBMBXDGvWta4Uo26g/gYNQO2ffDVFG2vh2LNHvqNJxQzii
 63RvpxXuAPrglMpZGdA==
X-Authority-Analysis: v=2.4 cv=fIusTpae c=1 sm=1 tr=0 ts=6ad71073 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=2OWSJv1YRWKtX4VDGZoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: vH7RVW5Ws16UVuK05tdE4b6A44H4ikIH
X-Proofpoint-ORIG-GUID: vH7RVW5Ws16UVuK05tdE4b6A44H4ikIH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfX0mWJoFPj7Hvs
 t+anXS+sOqK97YFiE+xh2Zis2fdf4JJgS0KC8GoZkiKdDnq0EVX1OvcqnCIM/ShUdSax8gZrq9K
 6JTCTiFksItE5WHt0lX7SsK86U/G4wM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200027

On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> The CPU clock controller of MSM8996 Pro needs its own setup, which the
> driver can only apply when the DT tells it the SoC is the Pro one.
> 
> Use the MSM8996 Pro compatible.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
