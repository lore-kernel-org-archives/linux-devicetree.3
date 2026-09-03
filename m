Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2273655EA
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 08:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788424464; cv=none; b=hh6Wp/+Bo4apRmcboBrXoSEZwi3mlaSK4w3Eo5uJSI8y/UwGlmthoSD/9CQh75jNNcgR+F/iuZ6EckrbYcFS29t5ohGtwJuWbTEYs1T4jJba+lYfZfYZUyXvveWi2EI8BPmEl5/gRfKZXypbqQoxjFYFXAyMFWExJR/2eS66Fv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788424464; c=relaxed/simple;
	bh=2wtGcDixD5YVV1h3eEW9F9Cx5WliZAPePh5dF/UV8r4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MMWAonUIblezOTlePLU9nK3kOIAVyH3E5oQXj7EnCGMJEZ+b2VPEwD+YS6ZALtlntQCgNanvbA4208rGhN9vD/QN0djYs/vF/M7HeFxt77dOJSgxKQkfYWrJkCshNh14T668ZV1c5bgZ+aR5pSRgyPkHxz2ftzlqDDYgxizb11c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bLWNM8/y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Im7eP4OK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bLWNM8/y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Im7eP4OK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6838Ql932954699
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 08:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nolidgfVOoM/xTB4yJhQPfIO
	/30el8PQJoP5vakcvB0=; b=bLWNM8/y08vRNOQ5XWWerJo5HBp3jbUvYWJ8+t9A
	u1yOegjvFZk89YcIIr10e99xsEy+bVubtvet35lRmcUY16CVlG5d9w48qfieIZGn
	bPR3AVT9wzgfR8ggtNocFdVgrpdCTCO32e4H+PYUnD9c3madT6gq0MC4OykAPDRs
	Qz3yaG2EhnLVX4v7OErHOVe2uHhN3NcMv9ZQ12GEAibvFmp0bcXelnIowH8MZQh+
	Vbh/ZJG70OA1mlGFATaEXaVI+hEjDjzEK643zVwON99yB+kqIuiw36cvHg+ubpi4
	N/KeqTB2t0nWVyg55J6ZDl4t4w0aNtFG1uyH0Vs7qQtDdA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5d1011m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 08:34:22 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f39a46efd9so11865216d6.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 01:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788424461; x=1789029261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nolidgfVOoM/xTB4yJhQPfIO/30el8PQJoP5vakcvB0=;
        b=Im7eP4OKsNTHYVmSarL659baJgvaZUBnHo8jrRJ4UWq5GXN/6nNWzT68CJKA+AM2FR
         8HaaZe+knbQHm4t22wdyBtPttQlBuWezt/Oi7ohgGHK8RHHTSIpFlQV+g/kQ7koyM3X6
         MsLTwA775R2dgWg0CbPWi+urI6a3C+T31XNtXvkR9/vdRZ535HoFqtzr6hmW9Foch5dk
         uZ2z39lEl5iWEEiwCozC1yJLQcC0PxvrhEl82sAc/bygg8DgZXDSraZ3XRnxBy4hvlrp
         E3GL6yg5Xr2CckYbg9lXI2+OOHOqq8fq6bkojgXFyFme8fSMr3w/xmF17GwE2N0vaXv5
         pvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788424461; x=1789029261;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nolidgfVOoM/xTB4yJhQPfIO/30el8PQJoP5vakcvB0=;
        b=G5k/u+UsS5Tc/OnvIAOpSRkx9Duwj+w/U5ITvYFQlTifAUoG8JWS7tY36X055+fCCu
         cQpuuNpo4yLZqjNvDhVYlzDgu4GrGbXny9JtAefYESzRjIucJD23vUBhYyf1923XWQLK
         HChH3E0ENpKUOXV4l3lX9iUYFMzfqgW4hhfoQCck21lNeVy8F2MOeCIVN4SNJ1Wwtacr
         3auI9tguG+aSwXrdfXUfaN3QUKgPFMH5IT214ah0FOgpIL8cqVFO2lE+sE4MZCx/MFRz
         eqRpoJplR5fTpW/YzmQhx6CwhkgXDDx4JZ1rWBs9sFu9QeXoTYd+QosyRvXTzQ93dJ2B
         Y7xA==
X-Forwarded-Encrypted: i=1; AKwUvBwbvmE8vTnqfdeyeGYS0lmia9lwfGOW3cxq2b48Tqpt3TRz1P5luS9xtmxa/j1ZX/hFOCrxPhueLY3l@vger.kernel.org
X-Gm-Message-State: AFuF++kjd/qxWyvldyVetXoFwfUx8hZCVEWw6cWAAkIROKKbhdYQPCX/
	Ncc/rt+yq7RKzRtpxpS2OOspH3GWATCwOtdTJ/iT9BbLpHh/QmPW7Wti+jlzdaVVzNUIje8DOGi
	eyUM0yIT2UGGng+yk0sBoGotuUzqFWD0EpbErnNQwo2meTs/aOuazTzzm0Lm6XjGG
X-Gm-Gg: AYBFou2EMhWPWcc3/ojSM3b0ffiebdh7RfhGyhjbwm/GZpl6xw9dmwScYz7jQwS6Tk5
	MLT3FwyCoVpwcleGkPqLIuFAews3xWhnCnWRmJkDjMgRVfcFp67tvM16yf4ra/tdM7N5tXlbkUm
	MSmOMEhwlN/Ck7MHvYbej7tB5VBIVPQ2mGkgyhNrL5GqFt0Mpv+VkNF5xnBoiX+jR8sVRowBWlw
	+J8z9YvR8YdWBAKgmsGj3dKPKvFbcx26hLItpFVWl00sWh7XtA8C+FNfDR9Wew2/RO1fYo4CoiP
	wRjszTQGWtzLY4l4UjT1ercVdg00Fy8rmsPli5/wwUrZXUePKWjFJMRJUwpgSqWJu299Bhv/KDx
	lHyJ9o9+dqFm5qQ==
X-Received: by 2002:a05:620a:9149:b0:936:78c8:91f3 with SMTP id af79cd13be357-9396e00a9damr362813485a.11.1788424460951;
        Thu, 03 Sep 2026 01:34:20 -0700 (PDT)
X-Received: by 2002:a05:620a:9149:b0:936:78c8:91f3 with SMTP id af79cd13be357-9396e00a9damr362809785a.11.1788424460331;
        Thu, 03 Sep 2026 01:34:20 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d2019sm52402355e9.2.2026.09.03.01.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 01:34:19 -0700 (PDT)
Date: Thu, 3 Sep 2026 11:34:16 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?B?SsOpcsO0bWU=?= de Bretagne <jerome.debretagne@gmail.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [PATCH v2 01/16] arm64: dts: qcom: x1-crd: Mark the EC reset
 gpio as reserved
Message-ID: <ygyu3t7o2p2xvm3j5wrxp4svzo2rzymvzgod2szhz4z57elc7a@hznrw2e35oen>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
 <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-1-f4ab7e4bb75d@oss.qualcomm.com>
 <3f26bf2d-19de-4cc3-8af2-c26601da2576@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f26bf2d-19de-4cc3-8af2-c26601da2576@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3MyBTYWx0ZWRfX64QZgSgIy6YT
 6ax23nTQEsvrlfCJVjeVb/sYBxoBnEO289HckVszr2MEeMbqAwl8PYDyPFQ3DUQi7LgQ/7PMTkP
 6jcYP01DTWR2UR8QPQjoTxqIOkdpMvN3Yu48YWh/Jh5wfLZHwpFWKwZKFpczPehnY0Pb6O7Fi76
 C4ihgcZfYC7JJ6xos2E6blysyeye1hitOqarnGouUBAVFEyrN2zvBRPvoQI3DwrNkMCum3A4Jic
 w6D7aE4Ifb86G0dWxor3Ip30Ir2orNCbLdU9HcgsdQExzOjEmdN4L7VIZiI7XhP+uNImuipW5m2
 HYI49v9Ke5YyF9lbaHIdgtvBAsIt7C3pFaz6i7B+SjqlKZw1I0AIQvFzYl1uWF+HJ4q5t3DAfmx
 mtDOSNJK5uZhj+Ez/MQmYQK4Cf1kY7n1W4xvTH6+fUGm1R/+rHrysZgMpt47dsXI7RXDUXo+yMo
 zB43gF+T4TBejbv8JGg==
X-Proofpoint-ORIG-GUID: DP9ldaNz060tyjlDXJJZGDw71q3VxQB8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3MyBTYWx0ZWRfXw1YJH0Ksive7
 bksu7+9Drcys2DUaHbx2fIM7+Z2jJuzubQi/OAlfnBHoun+UQK43Elnl4DCQhWUyoiz+lBeslwo
 fjWNNj6NAZL8ibOcCUA90zqSOUvmyRw=
X-Proofpoint-GUID: DP9ldaNz060tyjlDXJJZGDw71q3VxQB8
X-Authority-Analysis: v=2.4 cv=J4GaKgnS c=1 sm=1 tr=0 ts=6a99310e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=0yKSSKOl38yrq87U628A:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030073

On 26-09-02 17:53:23, Konrad Dybcio wrote:
> On 9/1/26 10:06 AM, Abel Vesa wrote:
> > GPIO 65 from TLMM is used by the embedded controller as its reset line.
> > 
> > On some devices, toggling the embedded controller reset line makes the
> > device not power up at all, unless the battery is unplugged.
> 
> Have you confirmed that behavior on the CRD?

Toggling it does nothing observable.

However, the documentation says this GPIO is actually tied to EC reset.

I still think we should reserve it, just to be safe.

What do you think?
