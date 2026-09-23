Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71838522EE0
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790169830; cv=none; b=T/KS3yS7VEvD7M1rrApv6z+XkW5xu9k10qpRrvY/RoqyaSK7JRqkMcsQ8TBhJo7643Ki4I1pdIsfL/T2ws9Aaes5LKluBoXv+16yaOWZnKZyXdlHZrgOtKDj4IzB3yuRrXo3Dc2wmpkKCFwTOzlMGo67mkLcR1BuiHs/eMSkKhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790169830; c=relaxed/simple;
	bh=vrbjCTtsJyzwtHuyaf91WcAhXyYix8svgAK1qoMzsKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rwx6hQNk44NwOT5RXr9gEuqaBoeDMIvGPyeC+64gtUf0jg1BtUURKKUSH4k0B+Gue+KCK8gj2E622fZreZUQj8T0KQUpk5a0ZyaRSlez/IL7+VHg15+g3ety3dphBCYUbO8JUZM0JOGyOY+1M74aeNgyaY0W8SK9+oqIS+AQvN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SJ/GfdNv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KFzUniUa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SJ/GfdNv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KFzUniUa"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbRNj3295417
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ui/R75E8kUWbSRcH6Jr3UdntL2soM1PcUyFJ6Wtu9YY=; b=SJ/GfdNvpBe4wTkT
	S1mXf1SgvWRVx7plQgwMrWgIYlNvgoqCHBexV3CFDcics1ykZdqJp4GWOnIufIAu
	xzAllA8gYDUM26ua3NS2ayqtDWF3cHqXmNUoqbpjFP4fp5IAgFFo1+Y3UeyWQv+n
	HxA85LZLFSuojbNHlqKvUh7v9bvcD7sMG0WavXFhIKX5jKqgBhko+uZ9Y+Pf0JKH
	i4b+uPFGeWhBqT3QnKYqBWCxm6lWNVTJ9p91WjDICDILVUkGBpg1NoOW8d/b6psm
	a3WkcNZ7KP0o53mPbD+LQ33XoRoiFxSpzQn1SPsRB6/JzUbfKsgfjuRWCEANVgGg
	JtJY4g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwm90pc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:23:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-530d89f2f4eso1362031cf.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 06:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790169825; x=1790774625; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ui/R75E8kUWbSRcH6Jr3UdntL2soM1PcUyFJ6Wtu9YY=;
        b=KFzUniUaOQLhI/TMpgnijlKixE6TW0Mt7UrnrYubGwTP4oqT9HNB30mzlWp7QpsfWU
         l1G6mIW5K73tSFPNPRt6CkubtO0KmNH+SHBXp7446MVLnr4ZNUVJbuo4W1f9QknS4ulr
         w6nnEf2k3BKu+t3MMfYbRbPZHI2B9zFuhcn11HkcVm7qRDwTF2IGN1R2WcJS4iySfweB
         qhbmSrQ4M6BLpP3Uc+tAGEVf4h7yZwhMSXgpfHEabyP4Nle7WXR7t00HHiFYpppvn044
         0f5BpGCCqsoLkpu0srADWQ/IQc8haRlrBgLAcpJk00Mh15A1NrF2l4EWSumC1we+xrhA
         vRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169825; x=1790774625;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ui/R75E8kUWbSRcH6Jr3UdntL2soM1PcUyFJ6Wtu9YY=;
        b=YY7Cs5yQwrxkvxJJXUEVGGkPmg7WYjj49v2wY4kbTVRHLEteg6/sq7jmf8qZiHe7xy
         lREKjChU7Z5vbrSB7If7VzyIFjolVygjd6aCOrr0JBnqz5GVZova031tIeEQuPm72q33
         LQ32ubsYmHnFcYAi0p6LZkXG0Ld7tKlWO69aP7TUX/aUk6RwGIR1PXJ9u1AdfYcpfeS4
         qDkQ5j4owel5akCZfPQcKHbwTUyzifh5iDeTevQvzKTt+aM8DUzfyzUuEd6PT0I/1wV6
         HArG4L7SV3VaoPDG9fmUVPDWZGpHh/kQChQm55WHgWCg95V9CNR6SZHsrnyWwwk9oAsG
         nr2A==
X-Forwarded-Encrypted: i=1; AKwUvBxBz6zhNPRD0GZ/sH7Y7Ax9zAuCtHDq9fu/d44lIkZHdZyuUULZpVeUR5GaMO+lyKFD9ZZopgnV0ynV@vger.kernel.org
X-Gm-Message-State: AFuF++l46J5W1nXwYpo8Y3t0Qktiyb+P3UBkhS6kzO+qB1t/LMJxH00B
	ADHk6jVlOyMdUQnqmc680H5yAD/JNS/yG2EsDlbHbA23/FuNWfIrs0cQ6Onznf34VKLmZURMSKe
	3WKj+cXDMuDEAbVVIcC4Aax/worM+x5EIwJe+PQjj4oGYO3/adze9d12CPCNMz5u+
X-Gm-Gg: AYBFou3dhkc3zJcy4MnHX1srLNaOa9uAAshV2oDdrzOdVb0SBK84LXTWuttdcXPmvDH
	oPPA+2QiGnkihyGdXCaMTxeh+xGrHDDSqu8A3uk5eKpYPs2Nb3RYmcZ/FK+yZyXDCVy3Fzvzx1A
	+lPp3PB3rEna3rQKq3V0ahkYiGdyGlZTgubHSiB6tfKrnqvvtgXiQehDw4lgyjDmBi3fx624rTt
	E+9hDhSM3VIGTTbotpOkkMOXDd87q1bgQrwsM3ZVb46rbHlqfwee1XbwcvBS1QZ+/E8mYeEzZ54
	uNOO2CjmAOFyKNtc7Wb5bHjbrzo1LEUTTr1YB8B/hVBxM6FQ1rLkEAyDrlivj4ouP3CzDYB2gGX
	hLoNi5NxW8gSGCcH9fysxWw==
X-Received: by 2002:a05:622a:60b:b0:52e:3991:84c8 with SMTP id d75a77b69052e-532eacc093bmr44926501cf.2.1790169824669;
        Wed, 23 Sep 2026 06:23:44 -0700 (PDT)
X-Received: by 2002:a05:622a:60b:b0:52e:3991:84c8 with SMTP id d75a77b69052e-532eacc093bmr44926131cf.2.1790169824160;
        Wed, 23 Sep 2026 06:23:44 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a62f5139e2sm7037091fa.26.2026.09.23.06.23.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 06:23:43 -0700 (PDT)
Message-ID: <a41366e9-2bd7-4a5c-bbc6-e5cc28acca0d@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:23:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] clk: qcom: Add support for camera clock controller
 on Maili
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260921-maili_camcc-v3-0-2f8d739ac2d4@oss.qualcomm.com>
 <20260921-maili_camcc-v3-2-2f8d739ac2d4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921-maili_camcc-v3-2-2f8d739ac2d4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MyBTYWx0ZWRfX7nDvK/4fJ/IM
 8WC2Pza4wW3Ey8+0nicGlRe5jXDXOmogk2+nn4gfPGek57bguxmREQN50PvLviumgirnvf4y8qF
 s0yRwy3Gro6nzivC8cRsdD5oNOYDL3c=
X-Authority-Analysis: v=2.4 cv=R/6WitRX c=1 sm=1 tr=0 ts=6ab3d2e1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=3jvcJnBrcLkHgcWL8XUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: FUd3BAxwrATM_mCznnx2FwXqJum25f6K
X-Proofpoint-ORIG-GUID: FUd3BAxwrATM_mCznnx2FwXqJum25f6K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MyBTYWx0ZWRfX+gW/2ojvx6xr
 XOLJun1QxH8ZoALlnb+GodVC5DJ36ptgCJO9A94glRrSKwSZXOssbm7pgXFBULMY+a8eXUjj6SI
 cJXPU/AYI9w9s87p41hGARaB65dRVxOj2sso5Ef2opQ/4JY5PyawzhTAnLHfHnWYcxIc+Q5Sdgu
 CMa0mpv7/eYyphWG/eTp8NXhfMC2K5+Ijw3uHrDwj4+gLskMVs17ArASpcKtTumLnIhkuGir/7i
 i5Yy5K7Ah8etqsh49WAiugd8G+1LJTMU2nIcyTyiOOaJZ8YUt2+D2QX9TSj6o6UTY1HUhb/D8Q+
 1Ga0GW1Sd0qQhMs7+5Ddn9W7BKoo4jv4/o+AmTAwJgPfw0WSq4XcZc7bHo9Sr0HdAABktYvv6jv
 cGS/yXAQoYLT6yQkdueMwLWZELxiRj4lITWrFm088pmlHY32eGfop1wzZewszOCSc6Crml/9+kD
 DvSY5SdotkbWgY3x4ig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230053

On 9/21/26 6:40 PM, Jagadeesh Kona wrote:
> Maili camcc is mostly identical to Hawi camcc, with a few clocks
> removed, frequency table updates for a few other clocks, and PLL
> configuration changes. Hence, reuse the Hawi camera clock controller
> driver and extend it for the Qualcomm Maili SoC.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
