Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B626346AA75
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784648189; cv=none; b=qHkxWMjJZcD8EW9sOrDNCHm2PhOpP6Ae58HPiiv0RZmDQkdOWZvdO8bn4xwrkPxoV8DZXVlXCnHeKkiQwiWd8l+Cw5dSAUyhmSyVBWJycRZmgxhNNrL7TcTezaumOkmiDHEi27GlStUoLzFp0++7jYe0kIHTdHrzU+RXiV6Cuaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784648189; c=relaxed/simple;
	bh=90ilvZ2uiFj9soGCmmuJZKFMtDRxEs3Q4N75AtPX8GY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FehKgsDKPaD/TC6amDUMIzqLHqZtJ87jSFtKxayF5FobDbTw6L+7O2NSlRU3tuxOZYf2VhvEcZryGsqU6NEQGJJ7JFayAtM8+1ultj3zzllbTkCmjTXvWRdsIfTVl18ThLylpILXUDkIM58Ue/R3MJtD6fl2VYztp3Uc7pej+28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=So5SFAed; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L9lNsSZ3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="So5SFAed";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L9lNsSZ3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDfv7L1938701
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:36:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	37qO0VWco0TU7hswZfa/wttTjRFPaqqUvt6iWLk1rxU=; b=So5SFAedodumVxkp
	eBfkKf30+4/LIArfN8wbHOQpb844CD+UT/rejDl5cZ5sKqbZ0UL3D0+q+IcNzuZa
	zESvRy/4PEAXtmUTpfXX6kmHjqX2fcgu4BE58HJthQ8oZXXxhvc7EszHJeberStz
	7hWHZjmm0iC2sNYImTdpAj43nimm/Ki9vs7wSsWFneCPXFfKOrdKGIUmxLxF2ZQe
	zi/1xbk6rWtfdArwUWI0Xo2DFd2GRHUsOCv1RfhRQRJ1oo1twjcvRDh2V1yZDRr6
	Kh9qwj+y5JoGaTCjXlmeBXvyptUAmscBlUspwEuf9GjL0v7Gp0haCUHMNYiQ8J1u
	EZOVSg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9bs8qc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:36:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51caa0b48ccso20487401cf.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784648187; x=1785252987; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37qO0VWco0TU7hswZfa/wttTjRFPaqqUvt6iWLk1rxU=;
        b=L9lNsSZ3e66F/dt/pQXkMYjYvu8GU3/tku+pVXQHBSphrCMOVM2EChFaj4O6wutwTa
         beMggsi4JenJqrtXZiKAiR9P4J9BrH4WqA0de35AZdyGParzd2HFh7sUcAsC0He4v6Zq
         5i2CWbCVb+XKgpBpZsFamtww2quaxywayicN6bGdKMJPXBs4OyVmnDKD7hC04p8kJrrc
         HDIi9ugEA0896jl2IGJkkKb/Ge95gaBTdx7qU4yYw7D/aM2APZM+b4j46yHgNz6G9WfH
         KjkGBF74KD0IFE52e86GVboKpypH9Pq2l8L00cmJxExvpXgoRRH3/sVkhbmQ+JQnc2V+
         Prow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784648187; x=1785252987;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=37qO0VWco0TU7hswZfa/wttTjRFPaqqUvt6iWLk1rxU=;
        b=jP0O9IRl02DMuCpZH6GKDprkybFcGQp5xYd/TvR8jOFtQytlnX01LCktiWPSM2x5ry
         DQ1oAhBTBylRhvA6Div+Wdp9ZTyOswCVG0ZgdgFlKDt0FVaTn4qGj1PPMX9w/HKk+34u
         XQ5jP9k4QG3qP8Rd5kk3LUOKm9olSHK+eBYQWZWrP9CCj8MeD54LB/eJF++01E/owmxn
         pcDvn5iRu1l3SIQJJfaPhzaOMydhcyLXA9Cn9yjODUUM4rg/mJiMn88DKydY3bSeD2Ts
         IsdE6EzcgTj6cnQLd9Dlylln6D5dbYKuD3NlbuvuLS5mO4tO93ylnCHY07BLzPxmqMnr
         TroQ==
X-Forwarded-Encrypted: i=1; AHgh+RrmzbtZwIdPkk1GTUfeCYAqRBH1auERH0VBDdh7YCAkBZDNUUP6HFDQ2/28xKANu6clnI3fPcAn9ovm@vger.kernel.org
X-Gm-Message-State: AOJu0YxX+Bm6qenPk6OUZs7YhMYJs+5XSivjFO2xZRqyvAvCkDXEm5+Y
	3w/a/qbz3ODIuHA1jsKNBUYL+dv4vxfZ3VDvwmr8WVjtYJu1JUcJKCpcwLcu4QUZGylMiCArrb7
	TL4pVfXfGU7tuCFDBqpmjkLqIUVkxFwcanh78iK5qqGeP49vy2qn1rXzU1AnPYsg0
X-Gm-Gg: AfdE7cnPk9CXido4CXUVggf58C5I4BuZ5H5c+IsEtrfQpbjlY72bvaVJLbUiOhIo+rY
	iu/pVzCy6sSxFfo4MvAPd9bI7OKTAn7RU0OOPgcO5PmYue9Bjgu8CtNYEpip7pWxOaeO++Dx5+2
	ZLlMllRJWIJxBiRjFNhfh9Z5vn0/GCbE/KTM1K9Td5Tvlz4cQ5HE5Jdjqcw7QXPdk6F91TUuj04
	Jkvt936PFTe/n/iUfhrPtqe+F+YgRDyh9yuWvwhqcj1i8Su7oZ0FXGPA4LUjeEmCIuIbLQQMOMa
	hrp3E8FWxUZbzVcM1I2xA/OWXc8zHa5sqknMRd6Bs1WvvhLgBxNfW4+FpxFexefw70nxP9cBYb7
	qvAgb9bDQh1oJQG0O/p0fLTFE
X-Received: by 2002:ac8:5e4c:0:b0:51c:8fb:fa46 with SMTP id d75a77b69052e-52674a27727mr31140321cf.9.1784648187005;
        Tue, 21 Jul 2026 08:36:27 -0700 (PDT)
X-Received: by 2002:ac8:5e4c:0:b0:51c:8fb:fa46 with SMTP id d75a77b69052e-52674a27727mr31140081cf.9.1784648186562;
        Tue, 21 Jul 2026 08:36:26 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c17009ae04bsm607287866b.8.2026.07.21.08.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 08:36:25 -0700 (PDT)
Message-ID: <56522c76-389b-486b-ac64-ded7745f512f@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 17:36:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: ipq5210: Enable USB and PCIe on
 RDP504
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260715-08-dts-v2-0-b060b68e0256@oss.qualcomm.com>
 <20260715-08-dts-v2-2-b060b68e0256@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260715-08-dts-v2-2-b060b68e0256@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -AY8paV9c3bWtSdT-K6PldIxW15vjvVU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE2NCBTYWx0ZWRfX9Udao5kZOOHP
 2BBXDjtV+23UX/tIiBVXrX+0rGlDtzeCP/31KYCptAitLqwVW23kyXb4RVsQDaXKgYf7l8kHdkZ
 mGeJU3pljSGXBsOkwMiMPnrdjouezEB0YeDtA6Xvz95GJ0RQEpwpJb5/C7lHcxF82ABipbW2Pxb
 o6zHJegc2OMWbtD7hmpU7XQR5dR/dMrBslK+MgIOSrpcJcLC6zbe0MIn4mXjDSEC9703NVL6KKU
 OmD0JpeND//xigHwDQU6ob4kuuq9NVM9/tGM/C4UnaH9JEYDhYC3MGTP8n8rnw0gL48Id+hAMJq
 MItcwgVhKMzCBjT/fp0qebNvTq+yveMhkJVWiaZYXvRzk7BnNXW6gOq5PV3t1AsH2k4Z9S54ECU
 kUyrORGo9xlSWGFFXbUWcSP+b1JLGWp46JOwmQyrkFcZJqxLBja0uRB7pDQmOQ8LSSMiAHeV6C0
 CP481Yq7jqnKkQUaW2Q==
X-Proofpoint-GUID: -AY8paV9c3bWtSdT-K6PldIxW15vjvVU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE2NCBTYWx0ZWRfX81gyqd5Kqthd
 i82DG9ZrQOrNs6JsbNjbUzMcvEf0cwGgc315+MXtKhCZLHDIl+6U3m1cmv+IARm44S/eKFRTXdK
 5hxPcDg8bnfcwZcbr+SX3r5KYJ+9Skk=
X-Authority-Analysis: v=2.4 cv=QK1YgALL c=1 sm=1 tr=0 ts=6a5f91fb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=ZVc07XdHWGtlc-ISXKAA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210164

On 7/15/26 9:11 AM, Varadarajan Narayanan wrote:
> RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
> share the GPIOs. The board has to be reworked to change from EMMC
> to NAND variant. Hence add the NAND node but do not enable it.

Does that warrant adding a DT for both variants, both inheriting a
common .dtsi and making the necessary amends?

> Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash

Are they controllable? Are they provided by some PMIC?

[...]

> +&pcie0 {
> +	pinctrl-0 = <&pcie0_default_state>;
> +	pinctrl-names = "default";
> +	status = "okay";

Please keep a \n before 'status', uniformly, file-wide

Also 'pcie0' goes before 'pcie0_foo'

Konrad
