Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820253F410A
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 06:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417472; cv=none; b=Hirri/v13DXe/TbL+p9ITpupO0GHHqx7pG8jR6vM5ygk/2YeDDDy4Fjzzqmvg3q5g2G50YbMm24Ca1wAITwrV0DcN9CYvusDLC+4q+murJs9MrjjWyfHXY9VAzGRWQnhD0evu3VJULlGE8Lrd1nND1rPQA2pOhIEts4wmXedmds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417472; c=relaxed/simple;
	bh=nZHYuewFovLeJ+5naPia4RsxMaLt2TuGBHxq3tZ9DZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nKxJAFHEP3RtyHiIfZWneEF2RkTKNue7ehkzVRix6TQihbeLRk4tEK9HxxIAERmhx+GLjWIVG9ZFUPVOB9SIrebOUrB3gu3Z/s3sj+ZOhdAP7MkVRNiFkOvlBU+boJ2j4qJdTB4daampa6Mz1Rl0uAw2FOp5Fwhnc6pzY9pOOHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gQ29/Lxv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G8uscEv0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gQ29/Lxv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G8uscEv0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lUKN2596728
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 06:37:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ik3oRHbjgtPPFglG5IuBEq1H2VDBvy4OmSK4g3fZNu0=; b=gQ29/Lxvw3aaA9aF
	S6HVwiejxuZ6+3MXShztUOQM2QUgqxM4vEJXq5P3lSGhLrulD6bAjDFbykrDusgW
	2oLk6AMkIGNF8Rsd54hC6AA9bZ+Y/5ttGUSjvNWnvItf+/FbnIhNtMUdaGvYzTrb
	Q6MPHSKGEIEtP/EzoTt8zQto36q3QMjPnRZNZgaMEIBHhSTWIDZn5tfZsDEvkJje
	8ReyRX2Brcy0C+Gz3Fs8Q1tc04rylv/ggJB+myQp18wVhDQ2KA2W04OZs/V2KDH7
	pgN6NQaBGbyX1JXdL2gjqVmj69nPLTQDgwknjw889DeuOg5CYbF0zq1b4cl9jRp4
	jvilFw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemja3wt4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 06:37:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52ffd22d2b1so4068421cf.2
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 23:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788417463; x=1789022263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ik3oRHbjgtPPFglG5IuBEq1H2VDBvy4OmSK4g3fZNu0=;
        b=G8uscEv0reXko9JGWWV0Pbr305oo0+T5a9p6ZvaeYBWOaOchhtJRl76mfSX8Ghk2Dy
         RPNfn9+QIP8tDhEp1EwNk0BsceDMULjg+PNhTlRHavMfbUMxmFmyZfOCmrmwDhtrumQF
         xcGa6qz+UR7gLWZzCS1QFp9ZrIFEEVpH+SZ4D15jQy9gL9QTHP+bIQiWf5BdY7CRLV7f
         hPwovIkc6BrYcnZTl6I4BBwzhIPjZYu5DvJqlXZr+zkpzriaPc90ifhvhkIi3GIdbTCv
         34jxKWJrY6SsMUOIuwnPlEymPgRryQBBaUMJgR4MfrB+F2kMb10yl4QOn328UoSAZsNC
         +WYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788417463; x=1789022263;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ik3oRHbjgtPPFglG5IuBEq1H2VDBvy4OmSK4g3fZNu0=;
        b=ilE5rQ+frzBtTicSe38oYBbC0X89uZE4txdvkhh093qcEsLAo2CkcsqRQl5erfluvj
         HdjgSCy4AEzFnJ8HuCPjG5nVNJWcpa4h2MXsHGgMPR+WLGjHxqFZ0bAHbzkDSrLmeMW0
         UU+YW4LqsDcc7IbvtZ0YaKo+ieROjZjyq67XK+hl8ZIRAfvKvUFRT1PGNauYA6+YD4mD
         7PdbgxikNjnxt2CFZqjOXmrkBRo1+E2gDlbo6zTy76OgUod+3UZSREKIEBQ/2N4POhSA
         YOgBgh9B39eoTSJeG9gnyFz9xpa2KU30T3lfGOYyW7U/HMZCiUwcmjww7EIlTDh38711
         Mh6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwmpgFjp+1+WG0rAPvyf5QTmP9fcsav71DNQHzVS8NB5MxwHUTw13JOYUmCeOYCTBX2Ru61SzJGwhcT@vger.kernel.org
X-Gm-Message-State: AFuF++lBQKKRHPEJpv4MtX6Q+UA5lwv3bX6MGXZEm8VuG798lUEp5FXy
	X8Pfw2LulyIydE3wQ9Q096sD6LepkgYDPH61g/iBzuZnioA2AQ+ozQw3jrKPKhVLD/aq23i8HA7
	99q1BGe1Zog3HSWoqoO9mVEMhw5h3PmWfC6ASx8/O56x/LuWlI9TgZe1803a33gSM
X-Gm-Gg: AYBFou0pRo42XhlWCE2CK0otqu5aFVNvZ2VRkZ94nmmsAlBRFay+A8Em0xi6i4t/JFB
	r5FWLOmC8ieKSuYnIM0GxOJ4edwz44em0apqfk0Idw71R0xsIaoGD6QNUlqNbc98AmoAddSipWY
	tpUqCsXCKxWbJCS6IOZ+lUdMTBKTVi3QfcsHjg/Ii14FLKTrqSmYpij0FGuEejj+NfGPtbL9nLV
	cm/YOrHDC1jHqlARqeoaMTK9u7yvy2iP24EvkRQzEPdEw0BvkywYWPDv6xYKnyygnKgXghuE9Q5
	IlfPc6Y+wPAZkybWdTulAtP3LbANrgospjJKBW38J7kF9GetaCiPMdrwSuIKHPFJSvs9ZiLzz1g
	Ga4iY0J7ZnqFFd71Attuc8g==
X-Received: by 2002:ac8:5a09:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-53036bb138bmr73180861cf.2.1788417463507;
        Wed, 02 Sep 2026 23:37:43 -0700 (PDT)
X-Received: by 2002:ac8:5a09:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-53036bb138bmr73180561cf.2.1788417462938;
        Wed, 02 Sep 2026 23:37:42 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f953223sm1781245a12.28.2026.09.02.23.37.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 23:37:41 -0700 (PDT)
Message-ID: <c4af75e8-5049-4cfe-a333-5c2b58e1da2e@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 08:37:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sdm845-google: Set i2c3 frequency
 to 400 kHz
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Acayan <mailingradian@gmail.com>
Cc: Marco Mattiolo <marco.mattiolo@hotmail.it>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, stable@vger.kernel.org
References: <20260902-sdm670-sargo-nfc-v1-0-bed1cbbffc46@ixit.cz>
 <20260902-sdm670-sargo-nfc-v1-1-bed1cbbffc46@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260902-sdm670-sargo-nfc-v1-1-bed1cbbffc46@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lg5Nu24paahldWUx61EOe572liOcTRUl
X-Authority-Analysis: v=2.4 cv=FeAHAp+6 c=1 sm=1 tr=0 ts=6a9915b8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=YOhxEyfzO7YiFk8NLKYA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA1NyBTYWx0ZWRfX+f/amy6IYbIp
 Q8jYdZM6OSQeuX0di0RlIiDAqcnEzl7fvY40TAIdBWm5evMQAWNOj1yCwFyh8cKvBlPjMK3/nSy
 SZ2ik+E8b8o2XDYRUsrOS/MNPLGX3oQ=
X-Proofpoint-ORIG-GUID: lg5Nu24paahldWUx61EOe572liOcTRUl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA1NyBTYWx0ZWRfXyKPQL6fAapHI
 VOV1WW5I9Ys65E6nhQrf3pz6fT9/IHUdZdGSPMLl5T/HsiW11y/6XgQWcyM85SiVpx2Eeq+RO8N
 celHimDN3SI68nT/eG63CR3oCliHPSVzRkVZLUgpvz0S3xpopY7t6lcMCyTHVcpzBLF7e1AiBZF
 qpF1yZAT22VMC14Vzacw7OtzUQezCYEML4XAbQQCeIvnoX66E+nuXC6/sVbVlnHrzhdIgZY9hIs
 DLJN2PXUnvzKwZDG29Nn+YBIu5N3a80donvJQ5ltFrGEmKvnyfu2RQeYsmAqczV6m1spRm2fHgl
 ijOYBY/BMk5hahxhX+5hzXQ1c+JsB9ew97yJctGSU9F7jl8jNO9r/Qxg9IbrSfUioBv4+e0QzD+
 iViB6dVc/74hqZOR2Gxmf594QUzLqlZ60yiKOnEpeZO+L8cYvW3ree6KgP1otI51YZ1h520tj4U
 BHmIjJQCD2hLHJYXujA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030057

On 9/2/26 10:59 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> When downstream value is undefined, it fallback to 400 kHz. Set it in
> mainline too.

"The Device Tree found in the downstream kernel for this device doesn't
explicitly set a bus frequency, resulting in 400 kHz being chosen.

This upstream DT also lacks it, however that results in a different
default value of 100 kHz. Set it to 400 explicitly to match the
downstream kernel."

Konrad
