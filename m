Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660200;
	b=T23xEv2OIyoxUWTlz8+kMFTGhLqMqq6qsyMF+lAX6SCcUr20yJI7+nHUB8EqL/v1YuTP
	 dX0/OEOMWjUXAbUZwAsnXCU9GOOGdETrwbzLEp2EVTCoByxzxghrFTDq7DOs/7taDxamC
	 52n6ZxB7SaFzKP4Ujn6GwnjbYJh/jwmWx+wfo5WxhdOzvPpb0DpMhBzZBBZKq8/GOw4WM
	 vx6aPzH1ZQPkzsTB3SUBSGwaozcvgtHVG994fBAAhHsGyFk6QrjmbobbOI4ozdR2YykQV
	 90L9Os5AHKCJ/iCi5BCmBG4Xo8MjEibYMsaTd+I5obiD7xw5mLzxs2q0WzOFP393MWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660200;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MuprgGBEIk8/OmsFZVmehe89ddAzvU7HKkgdbnCsQyI=;
	b=ZMleoo2rl/KTD7G1ciDdCDEKgquAnVS/kBwLNAM9sE8UrLqFbneIvL52yt36d9QmDGTa
	 XOJn9oZ8EU2of83iIHUOqPGgAbSPgIvv6q0FbCOn/zbWAYZ0dqidR+MGkegNCsrXtxd2o
	 wwHfaJOKh16HDXzhbMMLR46TOZbSvjrmT0ZmExqr0NcaFP18FHSUsOGjMPUKU0G9J4S/D
	 ozlsD/6hiOK1pwM5qnBfKgoRJyaK0jWD/eeNWBW3Bwg6MEU7Us3e5mKOx64lL1pKzRm2F
	 c1bqqRoxYLP5a0PC+7f8CIn+pUUxodMAnidSRHI9rL1sxtQethS3lhBKjfiUyD/u5Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cokJDPuq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="RJCm/ytu";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D9C606A330
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:09:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8D9C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cokJDPuq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RJCm/ytu
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M6xqb32171930
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MuprgGBEIk8/OmsFZVmehe89ddAzvU7HKkgdbnCsQyI=; b=cokJDPuqF+Vy0B54
	oofPLXV1SNCp2af/gPNdNs16tsHZSPlzLzk5vR7WPz6H9IFjTpTID3B+LBfPvt01
	YB+iCNeeQYoywYV1hO08RgGendxYh698aDt3sXVqlOZhfcKx+TclNwxLk4GRY38L
	4bOvopEKuswG00Gm3ayQ8MIp8/si5626dbbV+dASRCQrPzPegiyKymUXKeiYb9wI
	hiN0SPAoojQo8BZk0tAsl3YVsMWMxxIRIxbHiC8vJci80SYPC9g7UKQ5N79gz73b
	qQdR3SIOS0oL4W7zbueaR9ArbM06lBh5dMEerFjQlyWMHzJQNwtcAVLa82L29A0I
	/jc80Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahm2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:09:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93df7a9466bso18272785a.2
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792660198; x=1793264998; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MuprgGBEIk8/OmsFZVmehe89ddAzvU7HKkgdbnCsQyI=;
        b=RJCm/ytuCwgsjLgToibkZVvgT5eseFiQ9DtpCotzXIWhu0av5GyvP9yTE+ggQ7XL0D
         cX4pLiABHInNMJ3s1g/clL8ZfttxKURkTVoobzFieCeG9n9jNGd3tkweWSJ15ozCpcrV
         EaVZ/e+a8Zl+UWtg+ZXquAbNAHv+mF06f/x2LclgHHtIircb2oraiy2B2QTRjjkf0VNu
         KDgV2/Mdo5eVkMpa8fZuQLfImv0EeD/SWS6H8RxqApDR5EJIGgvLaGKy/EjA+dN8/oXx
         T3dGOZJyDHHJKdlznnaYn0YrxO9HCQrtt0rkdVJ4u538ulwVMs9WQ/xnel4EUOuOkI61
         7yqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660198; x=1793264998;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MuprgGBEIk8/OmsFZVmehe89ddAzvU7HKkgdbnCsQyI=;
        b=wZdv2dDUvegdy6vugYH5fye1EfKt9mRQDRGLOuQuN+OhF3Tkd3nz+5WWKNQeItZizF
         mzr+PQT/7frB3CwA2IROjA24sFyUnG2Y+PNZH4SRvUYonD6cQcMO9JjS/3aERa49U5ru
         gHHqumQ8sNN/55saVxgAHFzueSBtUub6Wa9tK4+h/V7lkLsF/tTeiYdH3KUHV/+1dOKz
         XpocW0Jumsnx8t+jsSb7jgtBW2mtm5R6UKRwwbNLMaBT3u6PY8BtT12aMc7Onu8YL3i8
         GXc1jbKZ9E+wsZ1GnrGiyItxIXyZjv31Zqlm0tet676FXxyoj+/o6Sxhg/7SIZH38LCF
         NBJw==
X-Forwarded-Encrypted: i=1; AKwUvBzU63tiMGnCubu0v7d1qgG+lohkBFXvoclrH5YBEvMi1Er4ZTeA1dQz8STUh7Hx1LjLqsrgeG3QYpbT@vger.kernel.org
X-Gm-Message-State: AFq9FYKfDAA6PY8a4/aD7ACQQ2xiDVhmsujQxwYFz5ROjujWcpFddBPg
	O7dzo+93/gnhC/glRH0b/7GzigaLpMRCBYE1uaUt/o0ZpowItXxlCII+RLQGRpLT5ED4CYp3jt9
	poi9Udt8IaZFexZn+hruRsjGVdhPnX06vmNu1mDmDr0em8ICdH684Nz9CrGhKJHZq
X-Gm-Gg: AYBFou1bFiDNy9iOkTek0SwY5oXVNLQmNYTfR/1gSAF9Bux+9q1eutIaCrTJAVOHjtp
	feDLmUWdLp8Qj8sJHyzRpsoNWtXv9YiJ+/E2nQteg7spdJAGpjEwGoMebh+CzkTiCT6sewDoNYs
	ZeimkVOFKBhidYWZN5TsFv4V59CsQh4FAbbDHyFwvkEJFRc05uhsDguZFwEUOYQNvS+D4+nHIP/
	SeiVo2MD8lGn1u182vqjHBt6iX2vki29TOeO3PxIa9C3lqLlgxKO+ysTUVp/ue25/V5cj7XFP3W
	x1Mw58wDDRr1m7XvRO0bGjZ356K0BQfx1L+G0yMQEnGl8ByArjv/A8TruQR/8Tj1ysTUImgPmVk
	07ARW8maIYdpaduF1Cl3ZzA==
X-Received: by 2002:a05:620a:4511:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f57f3bf10mr985406285a.3.1792660198003;
        Thu, 22 Oct 2026 02:09:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f57f3bf10mr985403385a.3.1792660197581;
        Thu, 22 Oct 2026 02:09:57 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a55ccabsm82839466b.33.2026.10.22.02.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:09:56 -0700 (PDT)
Message-ID: <9800eb77-0188-4b16-a672-adb7ee1a603c@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:09:53 +0200
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
Subject: Re: [PATCH 5/6] arm64: dts: qcom: kodiak: use thermal hw-bin trips
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
References: <20261002-thermal_bin-v1-0-5a29be7e8ec5@oss.qualcomm.com>
 <20261002-thermal_bin-v1-5-5a29be7e8ec5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261002-thermal_bin-v1-5-5a29be7e8ec5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cjHawLtEQxpvqz9GZHWD5LWXND74y86X
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX1y9M25kWlngb
 CkM2YOCHbdGIBfzlHX0MQ+QNT3h1K+R/TC5xHuw8AK0Smm7UjoN+TspnRNKacj7wM4f9mmGPbs7
 HOV3H/yIHptFukpDJTcMT/O1NFKyN+w=
X-Proofpoint-ORIG-GUID: cjHawLtEQxpvqz9GZHWD5LWXND74y86X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX0A2DePE1oaaW
 iDTI4R3bGVgTxxyabg8DVET5rtffxBYwl6a8WfL6Q1cYRGOK4OIaa0iqS0iDw62CGvOZjZT6Hc2
 FJBOrYDlwYyAEH/bYpfWUtX89h67tIzezvRdPcx2mXYCpI6nTkryFmQmotaz/+K4+Yir25W2dUQ
 0gSASuCSxAgnxlZbIbEjdDCCfP2tyXdaIKtGmlTsfUEPA6eL0J4CKK1ztfYxcBE8mNprvikkK2B
 ecD++yc4wx0VNHdPEPvSnBkxvLuEYWKglvmfaz83I+5GWyO6sEe7MFVO/QCXVUNWNe/IwQuxSc+
 Tax7+GKZe5U66GoynMwThBd6Jh8Br/q3eA5o5wYFMTrnhF6RgLQ1Oq3FKuMQwVwzG/G9Cp+2JtR
 bEc8In7s1UZucvInWe/UuNCUxI4jp3ilvXCi0m5y47QLg3UGdrXahnNWKUJllz2wa5kq5ZBpp3M
 K8YJN0rqWVz9ArzNBdw==
X-Authority-Analysis: v=2.4 cv=dOszC+Zb c=1 sm=1 tr=0 ts=6ad9d2e6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pjWewQ9WiOT9jlYbxO0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220036

On 10/2/26 12:47 PM, Gaurav Kohli wrote:
> From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
> 
> kodiak-based SoCs are binned at manufacturing time, with the bin
> computed from the jtag-id and feat-id qfprom fuses.  The tsens driver
> now reads these and feeds the resulting bin to the thermal core, which
> selects per-bin trip temperatures.
> 
> Add the jtag-id and feat-id nvmem cells to the tsens nodes and convert
> the passive mitigation trip points from a fixed 95C to per-bin values
> (95C for bin 0x1, 105C for bin 0x2) using the new
> temperature-bin/thermal-hw-bin properties.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
> Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 56 +++++++++++++++++++++++++++---------
>  1 file changed, 42 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 347815e5983e..f3bb9cd8f393 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -1019,6 +1019,16 @@ gpu_speed_bin: gpu-speed-bin@1e9 {
>  				reg = <0x1e9 0x2>;
>  				bits = <5 8>;
>  			};
> +			jtag_id: jtag-id@180 {
> +				reg = <0x180 0x4>;
> +				/* bits = <offset width>: 20 bits at offset 0 */
> +				bits = <0 20>;
> +			};
> +			feat_id: feat-id@180 {
> +				reg = <0x180 0x4>;
> +				/* bits = <offset width>: 8 bits at offset 20 */
> +				bits = <20 8>;
> +			};

Couple nits: please keep a \n between each subnode


[...]

>  				cpu0_alert1: trip-point1 {
> -					temperature = <95000>;
> +					temperature-bin = <95000 105000>;

Please do <foo>, <bar> instead of <foo bar>

Konrad
