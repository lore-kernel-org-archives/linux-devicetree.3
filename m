Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0CE48AE38
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 11:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791460533; cv=none; b=kl0hkU4ehjTuDHFOw0dHoQ4Nryxf8m5viywClDE5b7pU3VkHoei087RftuoxCs5d2+ps7u1O+bCjAkUpB53trow9um+J4x7hWtG8zThqSzuUATtIhSo1mhWLYzK/RI7vITkDoHuMqaeR7xQhNyC+HGx8E5LauWsZPVcYyEpUGW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791460533; c=relaxed/simple;
	bh=ceEvOrf5v3Z9+vRptPfuj9AfIT5gVhdIWPHKmGd2hmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ONoNk6SmZuYtCql24CF1Wlv86ZR5MuuqcUjdDIPKA2jJQIUmREafFuGrljr4I8RJdHtpS5RLmwmEYJclhf0sDr4x3JeQuYakiNz36rw8MPxKZthcrewbptSnPtUdsx1Dic7sSEnLz3+/YLkdHBKtqkdKk0qQDsJnC5sL8xowyTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h7LLuuPM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FHClCc6z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h7LLuuPM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FHClCc6z"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BJwm73846907
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 11:55:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8VyzGRMQD1q6z78jn5p1fT5AtGynvPGdQHGPlwJqf9I=; b=h7LLuuPMpWc4vT5r
	iZvWVyFc8SQvml9jkwS10kJDnysIPHx1LisUt/rTKwksSija5xYzyFsJu2ap1My9
	KCkSeNxi4gNWU4zbt0UhJQdA5EHwSjeoCrhHJSvMns4wfsEBoj4WuA9zMnvlMixw
	oO84yDKT/WuDjxtYi4J843ysL3G+8M3mG92nt0V1M4zejd1jM39vEn4sDjOYmHLP
	tU09D6kb9gbRsiFItvFjJGG9YWB+b0vUMLm+e5/8gmAmm/ISVhNeRbLjrjZgtlIT
	xl6c2OjSYCJLgNVIk1oLjSd2I5NrTvQixVTC3j/zwZy/Ze3ud+Xg2iaVYo7rxEs3
	47ZBXQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h60sgaaux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 11:55:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc5f70c8dso590388985a.3
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 04:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791460531; x=1792065331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8VyzGRMQD1q6z78jn5p1fT5AtGynvPGdQHGPlwJqf9I=;
        b=FHClCc6zH88Hoj+EyvA8lL96qBnMHMoKpc1nwjTWoLKslD/u2kzkZgF4Nv88V6fd+8
         7FVJFaxyXs/jGMvdQRk2m32PSxpcdGj38owRKAl3s9doSdNSIQhZ5VJxjBtoFd9pTTRv
         bKZepQ+y1zizpECzxqB10TtBTt++1SZ4LgjFmPVwQNo7mye4uXSktUi9lSxn9ksWZCUS
         q+lGWIuscJpkJFcwi8ebciLrMS1tEwSlXFX0/Zk7ix6h/1KIZithpEvb0Awx4wkGekAm
         Cub1Qav8LDUNSMIP5suRCGd7fK+0gYMh+Ja93Jq9ZB+2PicXdg0gInrcmQS81CG/+DpK
         Oj1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791460531; x=1792065331;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8VyzGRMQD1q6z78jn5p1fT5AtGynvPGdQHGPlwJqf9I=;
        b=jvWpW8B2ylf5MO6/OAiW6WUXgHiONEQMKm2Mtdx1UCdsLgKUzPvzuvuFP8+rUbKjev
         xzG7td83vsBjiTzLwgOXnP+dQPKLuFd72pc+f496Qlm3pwe+Bz1wYmQcVyDrFVaCvc7p
         b/kc5sXmm/eug+SH9Uh9nCxUZGQGaYKUU/8UPNXrLkTfBQMUCzPgYTA/WN5ADimwjudD
         bAacZNV9j8QjM3YJsbDFMyx3IpAL/sudfOBGWyntT+Db0SUaOw+FW0UMHujfiNssLzZw
         EJZ+l4hPDnuXDyrF/UER72riPLctd0oAwb+Sw/iVwTXUUbf2qAz5Lxw5r/nW7YulvVk4
         H3rA==
X-Forwarded-Encrypted: i=1; AKwUvBw9wT8oaJRfGTYMrVgTyOCFUrpYmbETgbrQNFcFCjlGKVhyHljFkq3Wtqt9+cULPJFigdknHDQLhFgC@vger.kernel.org
X-Gm-Message-State: AFuF++k2X85uFgyeGQuls8Dc21GEuRbEl/Fwr7kyStq5BEIiFpU6+osv
	nR/GfBPc5pQbdqYEqVbel0O0EaNw/tC5V0ofENyX9pIi0ntVZ1n4W8FTLhxIRgR31uIieV1M3Q7
	slzZsvVerLfG3Vf3NA9n6k6DHCoqbT1l390cCnor5l9Z0Z1yaVyLFYodo6kPO2MTBDlm8nbP1ED
	U=
X-Gm-Gg: AYBFou3tDStIOI9Jwj4yxZ0kJ+w+eVlZQPb+XR71bY9XS6q4WicQBtQQL7Oj3nD1sQH
	Gtj/KSIT2woqlq3eNl4mmW7oKBxqfSfxdibJ5Z9n6T13/gWTeWc1+0VuO9nqqfEx7z8DkmA29Oc
	vSPvjzuLveTBxJl0tcmX9ahyNZ8T4dcMN7ssdyahQcheQf2rmoKJMBRhSeeUssYfWAJxo2Mbr26
	T0Gks1JNlP6tNqo7SE10mP6bx33w7CIIHv1dCJx8J5ynaCZkxhdxDsELYrP82Cf791FPsihPEmb
	UU79IIyQzaRsLrAfnUQm6ScVX/Wb/uQntC+IPdPG1F0j1yaMVeHVlMk1rye4kD7EtOxsW6HYga5
	itP2YaYog1yRlMnxRVit6fNhgyAExHY/JkbvlnT/jN8HPsK2s
X-Received: by 2002:a05:620a:8807:b0:93e:9808:b9df with SMTP id af79cd13be357-93e9b83bab9mr959306485a.68.1791460530579;
        Thu, 08 Oct 2026 04:55:30 -0700 (PDT)
X-Received: by 2002:a05:620a:8807:b0:93e:9808:b9df with SMTP id af79cd13be357-93e9b83bab9mr959301685a.68.1791460529986;
        Thu, 08 Oct 2026 04:55:29 -0700 (PDT)
Received: from [192.168.137.143] (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48c7af26edasm5607062f8f.1.2026.10.08.04.55.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:55:29 -0700 (PDT)
Message-ID: <59bde1c1-ec5c-4ae3-b3c8-61739f280ce4@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 12:55:27 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: clock: Add LPASSCC reset controller
 for Glymur
To: Rob Herring <robh@kernel.org>
Cc: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, krzk+dt@kernel.org, conor+dt@kernel.org,
        abel.vesa@oss.qualcomm.com, abelvesa@kernel.org,
        taniya.das@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261002194436.1275056-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261002194436.1275056-3-srinivas.kandagatla@oss.qualcomm.com>
 <20261007211148.GA312846-robh@kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20261007211148.GA312846-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HE6fxOeQEtlsJZIX-CBhJZcct42legZA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfXz+ZP901lCvsP
 vn5oPUXnXS1IaXnhuUmoGhCxzwugTr7t/RM0oWJKlFzleoJ6Rd2875i0QJhd6gE4vdqgaSuOnbo
 WSf4B0phOV0A/ORv+QN5cIvCM0N90Wk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfX36mXUXEUe1VD
 ihsMyiTmC2/ps65xJuB3Jq2dXZkf2EZnIWgKblYGRjbpj7VRPaiDhzvT5vgfZ6f7a5NlLwWziDe
 3rk49o45FFTpFwHuHSiXtesPOVKBqwZM6K0KBSYXOGxXD9zrIyp+Y7+AtTdF7gP4ji0JK5I0Ogt
 7tyn1FxNAiRXZW7a2QZoS69Yz9QMuA/48Vf7PKrOoiT9dizQaUTaJCj+jLX4/UC/rZLCEyzDTWq
 YU8a3JgH6TmNr2I+FcO3gIWitmDXpyyjDPPKfpjgG9V0XOHaJTpUzfeKhKpxL2Z/3Bp2twwjbRZ
 /e6iCXgUj+nGehaN9ll8FL+Fq1zPEyaixBPLnenvzGC3ieiF5m9RYoY7dlMn+lqb3AgzosiJG7k
 B4vL8lV2VPL6vqmJeq/pqWW6SdH5JtOUtdhjDJ2z6LVdgu6ql9sEBRqyTkvw7EoqPowNNtSVEVe
 p0Mm5GAIml1ILcUS8yw==
X-Authority-Analysis: v=2.4 cv=DfWCOftW c=1 sm=1 tr=0 ts=6ac784b3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=zRh97aRZNhiOMYVz81Er1w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=V9EgoYKVrGpsH2p6L30A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: HE6fxOeQEtlsJZIX-CBhJZcct42legZA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080047

On 10/7/26 10:11 PM, Rob Herring wrote:
> On Fri, Oct 02, 2026 at 08:44:33PM +0100, Srinivas Kandagatla wrote:
>> The LPASS (Low Power Audio Subsystem) clock controller on Glymur
>> provides reset support for the SoundWire TX master when LPASS is under
>> the control of Q6DSP.
> 
> The subject on these should probably have "QCom" in it somewhere...
Ack, Will change this in v4,
--Srini

