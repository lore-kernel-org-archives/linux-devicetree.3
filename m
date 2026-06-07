Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2441C38C406
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 11:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780831109; cv=none; b=okwhA1eG9nygAxGHFio4XBVrvt7EttLr1WQI3WuzdNWArMgUQ1hAtwxrcE44NmRIjk6jtWBMDqYD7+WYHzmB+fNHKLYpW1vm5Tzn4mguAOKi3FSctofF0It5/YdjqX3lfqc/QbN2fO385VNx5zc9hpPSmFFg5XwmDsyjnbFQH6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780831109; c=relaxed/simple;
	bh=J6wD/DCzsNOn/MApc0FLDSV2u8AloBttXgf4EW9uKXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OjbbSMR9Ts7N/k07xHQMt02rYEQbKenugxoJdBSBmQSbqmekVBjUZ8ssf7QgGRXva75qxY7VXd0Xz9Qo2jR4MEeNmczOJ7jaLyX9XXFw8GygGdntPuOvGlgIaGC1RelgcQZL5kJuDtiCfVWjdCPLXFNnzLEdhL+v80zZDLH9z3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DuLaRoS9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XRxlUVVm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DuLaRoS9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XRxlUVVm"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657B1xpv436901
	for <devicetree@vger.kernel.org>; Sun, 7 Jun 2026 11:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gBysykimN/2LqYupOxQBdOlc
	nPYWCJPwXQfmX0+Z4dY=; b=DuLaRoS9hSDvVVpLLqpW7DwbmXJNfkSSTakC1Pjf
	fAOtMG2ZWoEA0f9bbumFIyiH9JczqDbSUiACqA3QHZpothxCuS1A01r5MEeDHQ7q
	5uFvfXLVnVyR5R6S0pn2vu2/NrUOOPpfOyIQcbEh9gHPtp0ucEcp41DeKXU1M4cQ
	LUr7BK6Ts+V9KpRMYyy4UPYs7xqZ3q1045eIcHQW387viOeEgxmIqc56MJhYLL2l
	DbkAvaWlxLeldh2va6/sTAGWlKFg4koDhYkFbCd26Oz2IVr9SczaOocwyTVE185P
	RxyyAISm0lG6rrDf2gbDcLl191l+ja4lAB+gjD2HPnL4Fw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4uydb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 11:18:27 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c6dc39a6afso1966912137.3
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 04:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780831106; x=1781435906; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gBysykimN/2LqYupOxQBdOlcnPYWCJPwXQfmX0+Z4dY=;
        b=XRxlUVVmI1YqS3vXAvGe90YJHRkBPLNNuau68I0lmplBunfnqSd/wGCHnLQaJx8J5a
         soUVTkrqP05C4Xl8B0zBSL+8otX00u8ZBvo7VLgcPSERKCRadGaoKfLkJQm1gwqGm7sX
         OUMn2cpraVvbjXViQdNaSzThB/bgguP0B5BBjg96y6BaJmX6Zoca3IEPakrcncfmVpHQ
         pwidmaP7SVjBmjQnXvuT4FvruDEHrKb4P6vmoWNIqvufOcJs6ep8ezlyqOZT6P3yUo8g
         tCpGH6eFw3Hr6zRm6wUOLb9vTULePSOISVPhtwBQUklIKmxRL5Zz8cBDX/IZhgixIRyY
         mbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780831106; x=1781435906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBysykimN/2LqYupOxQBdOlcnPYWCJPwXQfmX0+Z4dY=;
        b=oeHA5m8bW+wjgI/iFE/OzyuI0nEqqJZX0U09D10Wt/oVXjJnnfYn9rc8do01obHq97
         8RrHHw3hIhD+W0sG6HEcpTpF7qmlRoWvr0z/XcZqYqA/veydG0P4UDPY1sWLmJeCcUc9
         9856lTM/2OycIXcUkzuLx4w+DVeFSHNrAGbz/ufCKEdOUNahDRU0W3dm3r4Jml94+Zyw
         9+iQ78vuxRxi4tuwV0GkY2jW3npm4FShVrVeF7kXKTS1+vfE8iGisO/Vdlhlwz3UtVpQ
         enwdHZDjzUpR/8ccwqN/JIEfSZsTtd4DnIUHSKnuh9dTkzUsEVT/npa9YufwpTQ9CCDf
         yHrQ==
X-Forwarded-Encrypted: i=1; AFNElJ8xDBOdZXIzf3ZwGsJSFpVwI5/tP88HR1XCmSBLT1UNmB58hn/keLqz92lkmeIZMGgkCM4L9Rx94GNc@vger.kernel.org
X-Gm-Message-State: AOJu0YxcqB3Iq0HHk6Jo2r3qpL94xxEJPMFt8I4eNYV+yDFywF6ua93p
	Bkid9vTSBb5fVtrJUE/uti1Z0o6uevMOu8OYws3EekFyLfkJscDmr19hr+XhZIS6fON5Uo9Ffqb
	Oli/XBtra1c2uRDRLPnaHi7uu+7nBzWwhtpNLxK1/RIrxwnsHZ9DhT6KlRrfLlXRv
X-Gm-Gg: Acq92OGhFM9Yw+WHBDVPNxrYZtTDVLIlj13YBRYnu2r6ZBoXXsSx1V57jsrbW92Trmm
	si1OuRPnm3IDgemzDea1lwt6gqKHPuojP9BAwTZ5uNnsU8SFNhU6l+ANbvUF0A3iQtRUPRwmImU
	8s7oDVpgx7hX5qciJ0mRzmDb9ATin1HJyxUOk5BvRDqmo8FWPAkj2ojU7IlnaxnlW7q5pyG7c7Y
	ZxB8YbmOF8IbkyISj3ymwuPVAriLnyKv6cn3S/w+4xGFCmjQX6ADXGkJJjkqzqbTsBLNklkkVj/
	MODXVtzI6BUeD1OnnW2XhvA1CDCJyZ4W4tr5DIa6Abt/N9k9Az9Mgk2KTdVVPxQUzTkSGLP1Rf2
	rrFYQmq+I+OO9ONxaD7oBuwbAGQOcZlp7nMIDPDIAh4amzxUJgsPWmSXBjMgaklQp9/whGVBqVn
	kKyHjCoCPi1wdF1qdaKB4ptcEzEch7DTypil2mL7GLm04wEw==
X-Received: by 2002:a05:6102:32c8:b0:631:4cda:3e86 with SMTP id ada2fe7eead31-6ff0610ccffmr5411921137.24.1780831106401;
        Sun, 07 Jun 2026 04:18:26 -0700 (PDT)
X-Received: by 2002:a05:6102:32c8:b0:631:4cda:3e86 with SMTP id ada2fe7eead31-6ff0610ccffmr5411905137.24.1780831105936;
        Sun, 07 Jun 2026 04:18:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b990486sm2971499e87.68.2026.06.07.04.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 04:18:23 -0700 (PDT)
Date: Sun, 7 Jun 2026 14:18:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: clock: qcom: Add Qualcomm Shikra Audio
 Core Clock Controller
Message-ID: <foutgm5vhldz3verik2mje22nrnu3r3z72mxah5wmmuoro4l2q@ud3nbdgctpjl>
References: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
 <20260605-shikra-audiocorecc-v1-2-7ee6b5f2d928@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605-shikra-audiocorecc-v1-2-7ee6b5f2d928@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: FV3mAXE1lHCOCNyJY_lX_CcqOe2_N2_K
X-Proofpoint-GUID: FV3mAXE1lHCOCNyJY_lX_CcqOe2_N2_K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDExMSBTYWx0ZWRfXxFWhIgPatywk
 /p+bvtPV4P53QZla1u2RuD5dkV0VRyMDx9j19WcoUajfyhWQuWhIhlIEId8gv6L1Zbyh+kF5QZV
 NRJ5gItkaIO84ON6pOsFhDH3RkqNHVafivJv22rodEIWvD+nuw8ZR8+yL/QzobNEsdVvnVZ8i5q
 lVLOto0xRK6JZvKMB2+5/fLMBaKUVoM03LcBIEZSTzME+9m4N4UPV5akry56ZBqeVzqrdH0IiZd
 3VUkcbHfZaMU7KiN7Paqbwb3vrLvY6aAS5f2fSQ1Exf3MhIk3/YFJ2vaBs3gtZJxo+U6XRz7vRj
 VjwGiRUBBe9vI4aAtu1DajSuUEMIo9E1YsB4aR7ebtmrl4800EAFANTMNdKamEi19TrJucsuHVX
 7VVJNNH4b0c0fQtWshHiS3WkRBaGXUMYWVOopS3RiXsGKVkEO2jSBsRdhvH9enj4tnHuWUGj1Wf
 3bmZrN+NYQNoOD5/iKw==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a255383 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=3S_noIeE2reKQbcw9xYA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070111

On Fri, Jun 05, 2026 at 04:56:31PM +0530, Imran Shaik wrote:
> Add device tree bindings for the Audio Core Clock Controller (AUDIOCORECC)
> on Qualcomm Shikra SoC. The AUDIOCORECC clocks and resets support differs
> across variants based on Audio subsystem enablement as follows:
> 
> CQM (qcom,shikra-cqm-audiocorecc): need clocks and resets; audio on APPS
> CQS (qcom,shikra-cqs-audiocorecc): need resets only; audio on Modem

What does it mean? How does CQS play audio? What does 'audio on APPS'
mean?

> IQS: no clocks/resets needed; no SoundWire codecs
> 
> To handle these requirements, variant-specific compatibles are introduced.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,shikra-audiocorecc.yaml    | 62 ++++++++++++++++++++++
>  .../dt-bindings/clock/qcom,shikra-audiocorecc.h    | 49 +++++++++++++++++
>  2 files changed, 111 insertions(+)
> 

-- 
With best wishes
Dmitry
