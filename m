Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A793DB32A
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 11:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498875; cv=none; b=SHEX8Qkg6pp36dlot7gSK3zVRjFEwWPeWqKUfY8lyhgwZpyC4pi+nGSc35sGWjMzRfYRGQ9Mhn5VCUB9PBlWXn98DVTOVuECaW5f423yXAZAU2EgdvJxpmKYCZgOWItIufSvu+gX6aRlrMmyILo4MvQ+mG9SMuDn+NBORWTksEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498875; c=relaxed/simple;
	bh=tFtDhGcs3oKho/T/AgVJXutZcqQ3ppyIobZIA9jogeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e78FT4JrCoPYGmvfg8gmNZse2/rySkcwMoWeMxm9ZjflPoWWTpoZ91Uvz32bOpEZot5OV9XaY1umdG1OdJeG+crlO5AC1bOYrXjsL2Uitj476UWZT8cafsuKdjdbQ+uZhM48TGnxLFmjFCttDaY5W18PBAbd9Cnx65tIhRjsX8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VIVT4+wL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IPgvouzU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VIVT4+wL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IPgvouzU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBdDRC3371074
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 11:54:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W8NamFsvdE5+Gq8i0UVWQjN8
	PeSnapqIvw6cDDIG+JY=; b=VIVT4+wL+SOUoYGZEz/ScuH0PzAR3d9cdNnMKMo+
	wmimrHxZYxtJRubprq//1hRkohqEltFZx997NXH3xa0KmsorkFjwIRyJg8+4DtqK
	HJT3nZy+rmAYAKLX82ZLWwZjqL5lVUys1SYWRhqF0IaJUw88AZRq7EBAQYSC68/r
	dw+Q2qsLdqcFGYpE8fCrFzdhZtQF9cwFSWm/E3ZlZI5pax1sbtyX+xPqdzWNC3FE
	NnG8an4cQjdfg3vnj27WlswsVpVJuoYAkJXA6eUrAtE+ZDqbhA0fwV2JMQmn1u/L
	82E3buHPAzsipmXqVznAuc2JuSXTWprjBIKvd/ZoeLVJSQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru0y01mn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 11:54:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0199faafso8805431cf.3
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 04:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785498872; x=1786103672; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W8NamFsvdE5+Gq8i0UVWQjN8PeSnapqIvw6cDDIG+JY=;
        b=IPgvouzUvdsbxtjL5BIFiJd5Ww6xjbuOltRkI11UZpCL9QxMkQ2JvGWUAfUQz8Uffw
         ti1M93iGzRTHSuXKok/aiN3Eu6LnIm7C22T0t6+enEn0rUdmnQG9qviIdSnphJEpAkcW
         iHJAHi062m6uZVIaUjQo+AO21zeDM8CyK0L/MNmlYjRjwx0KQgdRgbzBKwLKymeGVYkx
         VgV1vcnUkax7ei25jIPQw0XZAuJRkhrak01SxfxCgXqb/12BkzRFjbvsb9pMSAIOlADx
         isVvwgfeJFD2rQ+1xe94KVMQ9zH8t9ruUnfHLtqnrIx9N/vurOcQYW7ov+hfAYvSc/qe
         9Vaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785498872; x=1786103672;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W8NamFsvdE5+Gq8i0UVWQjN8PeSnapqIvw6cDDIG+JY=;
        b=jyeSfxA+QaYX3rXK3xBs3asEOqQ93JVfG717wnPifPRJqhwwYB4BR405bzYsk4KS78
         OD94dX/Itxt382K0fi9oMS6FGQVr6q1Q+/4h23amZIoGfDLZfQ74aMnIIwIrPu3IB0Rh
         N9QJ1/G1lQ6uC7e5KNQs7pG09jrw4G+QCJXfLbbDBMkXYwhXT//2zko5x1zOaldkUo6J
         E6o74L9f75dJ3SW6Gkx6l2I3u7qK8J9zNGNd7q1GqYNvymUqjwWajqGVEs8gWnl8m4iz
         ZrsSvi7NPVY4C+wgHDSXsJD5UYvnRGEGbUQLQXFWpPaz8pB3pehlzp3kuLf0zV0JdgW1
         BoXA==
X-Forwarded-Encrypted: i=1; AHgh+RpfTdjk/isxKzvhQ+UIz/2vgV1CtQWqBIrQsaDDf1MjZtrE1O0dGzMzskgwBBU3cTFpcXydKXIsSiXL@vger.kernel.org
X-Gm-Message-State: AOJu0YxeZZ7homuGDHF+ryLWixIUETW0CPKui3Tdqi/tFM7cbs+wFtm6
	g/QfGRyS6omgQkPK250AFJGCHKxo9tF7FoYkCK8tFsPQZ8sCes+hY//sZSzGSHjEW7qY3eyFR2k
	wSnqoYrVzF38axgogJ5yAW1ToBgQWsLJ8d+H5i1xOgWV3YIcvoLtI9ykSy/8qfnZN
X-Gm-Gg: AR+sD104zrre4SKOoPv8FAFiy74ydzoiK9eZdb/I+tf/U6xLjtCZm6Y+bi+hKueLNNn
	GeczQXR4mKRK8SV7tLLdF5Fz1zz5P+JD2kDNqDIPwEEkyevhcjqi9b602G0C28iUtGp6M/wqVUO
	5Tnf5XBlE0CAyUz2fQLJc5VH8NknUOzBcg++NOSA4Q4NcIMIymbJetEpbGX+h3MSrLBZu+PwtOj
	1JOAfmH/sV/AtYO/qcbnF3d3oAqiidpNNrPpUBYg9ZgJGbd/ki6F+D27XFCi5KLWSfo25hwcMa+
	pVuHs+nhaE6tYo1HW6QYX8VR2vLp55aOOOfI5E6JWzlTdzq/kWAbz/3PQbiwWg59sX2LdItGyyF
	/ZQR4IjI0Mj3ktUs=
X-Received: by 2002:a05:622a:2282:b0:528:3b9b:4f55 with SMTP id d75a77b69052e-52b4afdfe93mr23862081cf.6.1785498872124;
        Fri, 31 Jul 2026 04:54:32 -0700 (PDT)
X-Received: by 2002:a05:622a:2282:b0:528:3b9b:4f55 with SMTP id d75a77b69052e-52b4afdfe93mr23861581cf.6.1785498871455;
        Fri, 31 Jul 2026 04:54:31 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458bb4esm4418730f8f.30.2026.07.31.04.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:54:29 -0700 (PDT)
Date: Fri, 31 Jul 2026 14:54:27 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: eliza-cqs-evk: Enable sound
 card support with WSA8845 and DMIC
Message-ID: <b7uh5ehsq4q3axphrtvew6xiyba7bary6ebmxfoozkgj3axoc2@cjwqcygoap7j>
References: <20260731084032.3106477-1-ravi.hothi@oss.qualcomm.com>
 <20260731084032.3106477-3-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731084032.3106477-3-ravi.hothi@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA5MCBTYWx0ZWRfX5guUWsb0AJCu
 tuKMTR2loEd7h6i9nKicU/GBm+orLyIUuA1Xr3KAUtmXwYkwS/kKK4oCioMVcuywSVXJRtiWtng
 9S6TTrwLFsLRccjKha/gGrPJ8F4NHxM=
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a6c8cf9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=i1AF-yj2SoNdfRuAw8sA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA5MCBTYWx0ZWRfXzsFwPV5PlBF6
 v/HAB9a1LevUQjOD/NJMDz1qBhUD7T7Mot6sMw1x1Y4aufOVZMnO/3aVsgh1JLYQ4VNlGtTD1MU
 6njMYztFuAAflRUyrYYsrTQN8NygErX9OmSePj8+sl1x8Yb+3xZgnaV5icTtRRWf/rpsS2Wck1d
 ZGEKhn+eyAYuJGyg6pPId0JHYbkD/bnbErapUOAHpT3mz1CcaUIZg4bUU1kBYMkWiO4lw4DU2Xf
 fvor/bQXQAi62tz+hYH07ntMB8NT7LzIIUfFHQ9114vUHNuwkk9HGmrEH1tspXdVx6zKU3Hl9bE
 8shcmxMivYooJ4/Rq2o7YzqMYZS7rcb79BUAkXhygLqIutChOngOqUBinMeyihAgHYyjcSURaOK
 z0Hlzp2c47eVuDMr4WyNQbcYmXIzQCNCe3qZjZvWLju4CW8yLfjr/QemqJyyujoeI4F9r3lW1Am
 /uGFts1AAlE+aB4uHCw==
X-Proofpoint-ORIG-GUID: iytbSDt68j5DbT853pyeRkxT_iPAhl-g
X-Proofpoint-GUID: iytbSDt68j5DbT853pyeRkxT_iPAhl-g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310090

On 26-07-31 14:10:32, Ravi Hothi wrote:
> Enable the sound card on the Eliza CQS EVK platform, including the
> WSA8845 external speaker path and DMIC microphone capture via VA macro.
> 
> Enable the required LPASS WSA macro, VA macro and SoundWire controller
> along with the necessary pinctrl configurations for DMIC and WSA
> SoundWire interfaces.
> 
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
