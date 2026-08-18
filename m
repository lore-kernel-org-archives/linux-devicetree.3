Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F945456E18
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 10:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787050264; cv=none; b=RSgGKM5/2p8THSDEbek60fHTs0f9tIjaF4E/s6mnRA3W4p3Cou9PvU6m/GRc5aSAWS+7AVGYNZq6uEcxCx/3qhHl+G4tknBTbW+KS85ckhCzBZbN2Kc8kjvJR2Qwi6FLFVdwTur1JNt+/hy1RuNbpuwy7sbLpKmji3xRRLkopyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787050264; c=relaxed/simple;
	bh=zWywIY0qAbAeFlJplePFS7ehWoGW77JP1RrOG65KofM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hnktd8g0aqfTEtM/5xQil7/t/+aMO8oOVVYo9zanZr4QbHiMjUmzCtPeQ+k104cBdj9Zded2M4dFb1dj+H2qsvuDEffMhRcaGNSOh1G0wMY9rNL9579YM4lv6E3LUcBh55c6RHblnt6K5L9ToFC038fwXfKdqSLVEDkpqVTNBmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mAmFGixm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W8eI5Zxx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mAmFGixm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W8eI5Zxx"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABXY51021690
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 10:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9JH25f5fXHxn1qnWh+eCbHE4
	YhoLC7i8tmsLfYHi52A=; b=mAmFGixmpfMust10ozp2lNPQNpSuemhmHIsk1WOd
	1513efrQy+YmogcAmKXJh00hrmnxUqCD9EtYai7APBrG0N1SWiCzkP7fi62WjTK1
	zgRR5+mGmrjKTG6SPSZjVYIkRJGp2441wynxaruXRQiYUTU7yrp9yXK1fw6/IyOy
	aBlYbM6COqRPjNAm6vUpw0Cn7EFeIFi6TAEu+7XSGrGpxNl17j28AwcxFkfsOrz9
	MA3g8gFyQ8g3S6L3pdX76totbtY9/uVo/mPsEwT6mFAnw3mhVgjvC4HejwPWJhO9
	eASxJYDrn0VSWqtIVnV94F2gsjwq5HfPwc38sYqGXdgPkw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g48q0u9c8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 10:51:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ef13b61bcso636099485a.1
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 03:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787050262; x=1787655062; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9JH25f5fXHxn1qnWh+eCbHE4YhoLC7i8tmsLfYHi52A=;
        b=W8eI5ZxxHOGkEbCxZOmIcUeTchlKTssfJY5iDGMn0cS2bphqD1BZ4F0s+EBSDeq9ib
         bpSxN5C8wSABbYnIyxBbNm58FdlOgpK7L9Qnz3ayULSu7NWsYNwcwXeLmffbW5ibBHCg
         1p36cEsY3z9zBIwK9p4CsmUTSdr1I/mdofcFpCsDw473G3id5BcDa3V0aO3EI9Krqdxr
         WeKUzQD27m7A0l7c58iWa+4C8SVAU+K0c7QhI6XgxxOdBHF6YIwQido+gk7JkiERqOrE
         Jna9HivjIrEZ+2Anr6ebVFFq+ya6OOKyQSOtlf7sKASX9d3elXU4pJPSwxCKGzTZ/f2W
         x7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787050262; x=1787655062;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9JH25f5fXHxn1qnWh+eCbHE4YhoLC7i8tmsLfYHi52A=;
        b=EAG1nE9qh47SLWMQ75jE4nEX0bDeMyquUTGBnzatDsyu8aO/q00hY308hY2f3EEvih
         f8MEgagTq6h5ymIWzcS1cAy5XjCmZeqA6Q2+jzm3YzG3jHnDAcxXc9sgMJ2t1ZyErNR9
         wycSphzVXKQIiytviMTd04nDm6oD2aP7Q9V2leA5z44mBUPU3IfyjjwREKCa5Yil7EKk
         d2x5Ifv54qKAjmPkoLDCx/RhfesdZNNNk11H860Pr3EEzHBCYL5KnDxD2uiOipwpUus0
         Q222IosFGrOtuVUcxO9lOJ0WSjOS04LNIWRkQdT67iVkcFWHMQZC/0rg1u+xLmK34sgh
         Y7Ow==
X-Forwarded-Encrypted: i=1; AHgh+RoRJs6uyV24avO9G+jIf97jjzmwkVxWjEJ17mZhhIpIP9oDG2s0WuYQNNWbWJN+wzXsrRlYcPys7e97@vger.kernel.org
X-Gm-Message-State: AOJu0YwAs9PKya9PT327S/MyynuM3Hi281ndq3bniIywH+EZtx7OuhZ+
	5kkIRIaNppR+ZrMBOlQvp5heoJ8jBrIkCSabBtEW54yabfiL2PyVutVzg88iBoS0k//wtWsJaWE
	oL/cmACVXq3fmSfhQCHqQzJPalotp+/wPSVAYscRdWoYid/t1eK5uVEXDPNDc9OcU
X-Gm-Gg: AR+sD12GOU9qqPt64D0RLRu85q0/ilL9E3bVrxrYU1fArbsKOvArwlGrm/D33xJKPe/
	k18JYOkZhvOLJdr9wy0zWPul/o/m03uyoaXN/4kZEdrBXaygiF03V+4yUMluYadzHsEM6ecyCr4
	XHGTUI0zveCg0tD5UxfgweZ68rFHc1yvrGRRFzfW93FW1KhUBZsTVHVt+88Aqc9rEsU3odWXn2i
	pGkz/6QGIMv5UUpSFJtF05RuVE0nRjHHczAxP+J1Er8X3usKM4KmE6N7hxjFTxlkwSUQvU7gAR1
	kOPdC9eE1PYwHMd3kiSpQ4vV1VurjwRq9FpZzewGAN0k4SZAUQZ/xTa9TrsFVBd+FrvuFj88DjU
	oqWRCl8IZFCrpZjg=
X-Received: by 2002:a05:620a:462a:b0:936:e8c0:ef0b with SMTP id af79cd13be357-936e8c10514mr1950961285a.19.1787050261734;
        Tue, 18 Aug 2026 03:51:01 -0700 (PDT)
X-Received: by 2002:a05:620a:462a:b0:936:e8c0:ef0b with SMTP id af79cd13be357-936e8c10514mr1950956385a.19.1787050261066;
        Tue, 18 Aug 2026 03:51:01 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49996100073sm282369775e9.3.2026.08.18.03.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 03:51:00 -0700 (PDT)
Date: Tue, 18 Aug 2026 13:50:58 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: shikra-cqs/cqm: Add Type-C support on
 primary controller
Message-ID: <ufpykzrrejcnyf2hbmjlmayd547uvygh7vz7bs6vygc24b5ydq@ftwg4vuqtw6s>
References: <20260818-pm4125_typec_changes-v1-1-6e6ede93db19@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818-pm4125_typec_changes-v1-1-6e6ede93db19@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3OSBTYWx0ZWRfX/oHULT+LxoHN
 QUnu8VJDesf82e/q6TfLvnAPhTHapwaa04+aFD74+znINuweI9JOJEpCTedghOjT+yr7zo1XLVy
 gAyJW9ogG3tsxRoQzmytt0rLfAMvop8=
X-Authority-Analysis: v=2.4 cv=VuITxe2n c=1 sm=1 tr=0 ts=6a843916 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=MWQ5MxpqQmLbYKd5IoMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: eMqVsMp0W-_FicAk87YUrs1kCd_CZ7DC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3OSBTYWx0ZWRfX9LFzC4pxKVK0
 WR6AvJ8fCPmCgdCfhT+WAtJKgbNkCipPs462Tll3JCeHVKhltTiWicc7ybG0GGJQ3RjyR6Zhqw2
 a2gmTQvWV2Erz5ATnM8Ud82EeSvGvalPklffuGenD7S1+3rmjDEqsPSDn7z+/BPLQiPRLQ8fe3k
 t782VV6gJsvQULkcT5OJtw0UAWHx+PZmnKN2b+Z0zm//WdSLMzZSGpUuJR0EjvSMRIml18oW+nL
 +tTfnQCHJ5GtgVR9IPG4ljfX2ezXURihD70pFQvfv9iJnBMM4YXAAXh0ajscOB56RqiAxwS7j0X
 e1/NhNk5tFEpXc/xCuxZ78DZuAxf+hAomIhPCAvinKS79E7rvx9BUedLJJnWEY2fFJTY1QrVIUu
 Y/O4EDFQd915ncIiz5oysv9F4+MpGc5xAGIubqzRK5r+nR6vmsQuSM639FTT1FdTWS1tvdMIQkE
 C2Xq/nKQSvtdqAohxAA==
X-Proofpoint-ORIG-GUID: eMqVsMp0W-_FicAk87YUrs1kCd_CZ7DC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180079

On 26-08-18 14:35:26, Krishna Kurapati wrote:
> On Shikra CQS/CQM platforms, usb role switching and Type-C orientation
> switching for primary usb controller is handled by PM4125. Enable the
> PM4125 Typec node and add remote endpoints appropriately.
> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
