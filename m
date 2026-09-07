Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248FD3ED3BA
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 04:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788753828; cv=none; b=IXBcDXApDuegYjomejNwGNwNk7JsBNQXCVyAWSXoERyiMNJsnqZUMY+9m9mQDoV7VJfCcsOYwcWJfHuvRxSpJsU/NClYqFg6p6Y+jTSS4p1vQBk9KeRUCNJNQA3Y6MDR3R1t2jveVLWwlCOxHWvsoUW1RdKGofyzaxfKrSpEjo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788753828; c=relaxed/simple;
	bh=sTKj9Jv2t7/BXQkxDF3ghvbikI/mjUGSNZGW6c+GyMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bCI1DVvVwTNENjFUDcpKe9fs4r+eeBnLL5Q+S3o3xukInulLGshFn9Ql1Bua+Z2seWqhl8sgdxcso8w/UA58vIGpUCvu89UOpGOtO2EaFqTtbLrILYF99IFttKi8vI4BtSIHHlitFd5rcFnStnnfPegOGn03aSx9S9XvTxJx4uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MBIuitbw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IunGOKcG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MBIuitbw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IunGOKcG"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873l2eM3235506
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 04:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sTKj9Jv2t7/BXQkxDF3ghvbi
	kI/mjUGSNZGW6c+GyMU=; b=MBIuitbwxT5zwJkvMtLMB8s1RXqa4SfhuLJoqZX4
	8YfpmR59vTCoR8JsCiCygO4Uci9Q77oYkXsSyfRG0KAHZa+h0/Cp7//j6GHgUK6g
	VSqObHE9odCpKinaFNtNkxqJr7+lBeRE8MpqcnZL4TehpE6WZuzyPAwXtARSFQY7
	u9/WJV/GJNo8J+u0zuJC7+pIQ4V7+3wrdAG1/XHNv2ifDlS3yz1r3BgWtSkEFTRM
	zeDiW0FnliI8rmFylZyvIxmkYAosUPlzt91D6yGiT5rj9LWwlvqkPNjNpRKPHL0v
	2aX9ox+us0J3/eajvfvWuUy+2QGaxI5V+jbiCk3WskEdyA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gga3751vu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 04:03:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39b6416441eso1367553a91.1
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 21:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788753824; x=1789358624; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sTKj9Jv2t7/BXQkxDF3ghvbikI/mjUGSNZGW6c+GyMU=;
        b=IunGOKcGqEgKF5b2Qe4MZYzJseSFkCkQm+bZrllDkdmr8g3yVwLUZd1Y60pHeQPjOV
         YvtDrDCYllfvCWnY4shXvMXY4aNwwoXDErvpoYbu9xR38z046clTws2dATKb4qnPI2Yi
         XozvZTOn4mOSMHMM56q4LKp96lZktQwtugk1qPGXoCRxUrhNwEx2n4PjtU/6FwsmaWOc
         H5g7jeiw5S1dZ0FoZ+N7pb1Sw4TreJQ510AkchVD69SwTTfMZ486oj2o04Bn+Xke2lP2
         pBPk/rfxpO7KMetNXSDfCih3G/aSmA7AhoIzUgKMoYw31gnLfRQAOPtTGPT/sbrDsElr
         ogcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788753824; x=1789358624;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sTKj9Jv2t7/BXQkxDF3ghvbikI/mjUGSNZGW6c+GyMU=;
        b=qyHqDPsgi8mQYAQww0xk0hVZpf0oNcjQxs1MmugoblP181s7f9ObzeBIj7D7jAgT3q
         ODXWzOpZM1QuM/QIj9qGqxf0NlGyZ5G9XOj0KqQb1MIRZ2h4To/Y5d8QsmhamjrR+J8Y
         4YaXEIM5f+ZJI1ARFebCq8A2+5RhvatvV9ylXW0KaKR/qr/3naKh1bDiADA2Kw5/CAmc
         83/Qcg8SlqopzIa/0LV2Vhk8PhAKjiNyL1wgVBTlqv1ZikgZOJwo7cocuPTBzEavAHlY
         oYjkxIJrhMjodwugPScMkmROlGkt2PyY4xg8196ElqhW1kl3ABowY7z3TRuCaeOruoYZ
         zVvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnhCR1g700NXlEYPED0bcbjmC600zM+0jA+F7gV8fu2HOwiOzRxaosD6rniBjn8d9ncIQKS3AoqHKq@vger.kernel.org
X-Gm-Message-State: AFuF++n+F2X73bRTQsRKwm/fksBivm0LKThNK2Luvha+44oWEW669423
	dtvc1RPVjMCIGwZHco01Lt2TFIEVWdMyaVOdpRLMPuMXvU0Oy458n1ZWwBSEALwnBjZ0cMR7gdi
	iGbT+hio0aCMiit2ju7NQ7uTRVavvKX6snfSDXO/MZkLWIqrnvv43UBxcuKmwMZ0A
X-Gm-Gg: AYBFou1SPG4VZ050dRC/L2OMU+Uvn3bEeh1hDGa6BiNqYO476Y4ZgVVaU2P8jGOymAd
	jNg/+n1vZLwvLeeJFyUu6qkDtnU+lOsJ8j1ksIEbEFeSvIpD9j7naTXdnymiXhChwQDVrQOqSGe
	O6W6k2PudpkMss4nRRSX8nFWSFgn3kwlWF3fzozVokMQSDzBT++VKZmao247ylkGDIWvaG5JvZC
	+nHD3zCRoPUlt6wQJ9mpevDtAanzBBZxQEMJcLv/esa14cXdUI2NLEU8WYLh9fgFK7GEvJIKAzh
	Jxak67KXZQEMyPyxQdmat2PUNAwzEljh2BBugkiExQKQW5qm9jwBiv93Ma3YC9tWdE8+jD2sYF9
	OgJJVKGJrUaNAG6R3aE33gzHHrv2XxHj9gyCfxViX42vgLb2Q2DSvofliFdXOWgdLC6qIkCZRnr
	48HFvUDcQASceahY9o+idft6Cq3hDNvw==
X-Received: by 2002:a17:90b:5866:b0:398:e73e:5a13 with SMTP id 98e67ed59e1d1-39b2613272amr30401136a91.9.1788753823957;
        Sun, 06 Sep 2026 21:03:43 -0700 (PDT)
X-Received: by 2002:a17:90b:5866:b0:398:e73e:5a13 with SMTP id 98e67ed59e1d1-39b2613272amr30401097a91.9.1788753823505;
        Sun, 06 Sep 2026 21:03:43 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885d29esm26399531eec.2.2026.09.06.21.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:03:42 -0700 (PDT)
Date: Mon, 7 Sep 2026 09:33:35 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: george.moussalem@outlook.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/10] usb: dwc3: qcom: Add support for selecting UTMI
 as reference clock
Message-ID: <ap43l807O12nnw/T@hu-varada-blr.qualcomm.com>
References: <20260906-ipq-flatten-usb-v2-0-dab83120b10a@outlook.com>
 <20260906-ipq-flatten-usb-v2-2-dab83120b10a@outlook.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906-ipq-flatten-usb-v2-2-dab83120b10a@outlook.com>
X-Proofpoint-GUID: WaHSPqLjPTSJHKH0cZpTJ4YVRaH1zpwG
X-Proofpoint-ORIG-GUID: WaHSPqLjPTSJHKH0cZpTJ4YVRaH1zpwG
X-Authority-Analysis: v=2.4 cv=CbQ4Irrl c=1 sm=1 tr=0 ts=6a9e37a1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=6e2pY-Gdj0T4IznGSBUA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDAzOSBTYWx0ZWRfX79MyzTYB1ab2
 UOUBoLCAEvQRDYGkg8JgS2X+CQMx+OW0yFxcWSplBAm3Lrz+CJNUyg91Gv53IeYRnqv8jxQ4VOc
 PEVJ5M3fdDEEqSXHfT/YQA+m3LfXdM8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDAzOSBTYWx0ZWRfX2VopofN8lMKf
 L9JHIJfcjD3ZNulvkJ25uDzRTzL0WD/jlXDSu+tCcYtoBKSv8UOhn9KpwraRZ6zifW5BargsxLF
 xKaVeTDb5fEMjOcGYmk69DmgWXthdBOPbyo8iKp7bOSrrwZIgAzK0oXIlfOZ1mHVpsuaP41/KME
 6cmy/LioIDUOtGrdULSNs8mE5sNPdF8z8HNDwi/hq4vaHgRRlMBF+1zoYIvXjAPi3JK/09i4Ppi
 OPEyTR672Lfb+1WOYygEFBPlTr9KI2xnlhPEhXGIcliY1MTE6yb/tGy6nS7/xYYpFuztPCgtgIY
 jqNhw+D685MS7B1pxotlwdQYzGEtA2KF9umFhp+PahSaTHQ/jV/xUTebLGJNBS2jWuKP3YXBs6Z
 gxVbFqc4jag8sjYE7XHC5Rz8FWqsb7FH6pQ+wifxWaX71mr5d1pw1EQZjtdoQF06bvZadoc0Lvv
 B0rlJTuVWA2pcAOXyEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070039

On Sun, Sep 06, 2026 at 07:52:41AM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
>
> On many Qualcomm chipsets, the UTMI clock is used as the reference clock
> (ex. IPQ5018, IPQ6018, and IPQ9574 and more). Since moving to the new
> flattened snps-dwc3 model, it is no longer possible to pass the
> reference clock to the dwc3 core driver.
>
> The clock rate is used by the dwc3 core to compute the reference clock
> period and frame length adjustment. This is needed when the reference
> clock rate used computes values that deviate from the hardware defaults.
> Above mentioned SoCs require values different from the defaults and, as
> such, the core initializes with the wrong values which leads to
> non-functional USB operation.
>
> In Qualcomm chipsets, if available, the UTMI clock is used as the
> reference clock. Therefore, acquire the reference clock by name
> ('mock_utmi') and pass its clock rate to the core using the probe_data
> structure.
>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>

Reviewed-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
