Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C0C371049
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 11:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785844288; cv=none; b=aqHau6nQ+D6Oty7Ox3Fp1gKnOT3OsYl9uW4W/gh73YFqMcJRZImCd7LmHsA30AqaiDdxvi8apmRDDMo1lO/beihy+Fv9qjZt7K4lsUKJSW5Pzl4xwppqogxfK0CkQp/Lf0zasRE6qJHeGS6sdBf+HMokT++Nd8oVaX4kerFt89c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785844288; c=relaxed/simple;
	bh=m4+FF9aznsbxg+UhNxCnj0Zg8uo1wX8zDYSWCAtBRkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mnz2opOM1x47DDZFhdnRVcKV7lxwZ2aTY6avAZntShHo8hPH+FqyuY+S9FAkOiJWakV125vqH43v6GfENrHoedPMK1DOg1Ky+XWp9icknaZHrRHguniRGJrVc3cIrbMHp2F6nV44agEli9x0vvWEo09yy8iMz1W2r95OQGVQi/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JxzZF44d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MTbIqOBM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JxzZF44d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MTbIqOBM"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748CGf73034315
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 11:51:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bktLxQOI+nK+WbE03+Qv/Ll5
	m7truWVn15kwgzjSVnU=; b=JxzZF44d+XPXzwmD7MRA6moEcrchHr/+hB+pjmbB
	iWAAH8spVtwyad9OvTpFqVLtNBG9jKohiRuqY2JY5rgonc3XiciWAC8zFddkDu8l
	xSKWFGmOyfZNLeMFDfNblUutnKMEE5aipwo6WaMk6pLIDsUZlQp82tGCGOQV2Rfv
	eaqyjUTtiuwxSG8nqEjdEbvEtMHJXi9/tvPmzvBOWpn8M8oockGX7m+yPRH3E7p3
	UJu8YCMg56VOKwTKcXSpQK12eqVr12oDMDFRxERqFz7CKGr/kpWe02GomCbqfwLr
	AqT+JtScqKZUjiM4fJTaUL8mJNOBQzuvUiYpKP+zGSkdzA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty3qm4he-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 11:51:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93494174477so309108285a.3
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 04:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785844285; x=1786449085; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bktLxQOI+nK+WbE03+Qv/Ll5m7truWVn15kwgzjSVnU=;
        b=MTbIqOBMxyCUSBsyvEUSqmmq7Ahg5gEYKVHlUA29V87OILagZloQZqQVvFyiEw7wX6
         en7BO5A6MqyeLqPZpwu2jwhBozpgP+tMeFxoOWdzF2BOr5x8Cne38dt+0ab2AV0NJZND
         woUwqj6HAC9RT7KtLhwOdGYtn1Hkrvi4P/gcm1f1Z9C4sCr9ohHvDKEXYiYmEFjKnfKN
         5nLfXOSwgTpHL5C8VcQuaA2Xt1fskxjtvEjPGMo+ChaFUKFENHUxsVVGokXvHMLSrebB
         x7idGxkxr/8CLS/m+Q3xAWETns2XG3EX00ChyJWNS4H3Y7AyHntmjw2ctX1ii/JPcjRF
         1oqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785844285; x=1786449085;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bktLxQOI+nK+WbE03+Qv/Ll5m7truWVn15kwgzjSVnU=;
        b=hHdPKKgnaW+DbclRSFwHBzspOowNF2TiGPqjCKrB8/Dlma8fjqVfbFH67ppVHP5BHD
         WQJf2FOV9+qOJYFQgooX3/RWttabGlups3XMcqE/vMbAVh506LjrbwuJKDfpUSJdu8PA
         E8TBbdx3NVbYO5UP+1lCRicT3eG4NEL2lOrgvNeupMA3/NNfN9JX1ChndUBr1W9JuX5Y
         pSkZK+NQDO3iOXM6i7wgFOKs1q/A+vdzZGMS4YERnQvAjQdKKjmjCsQA4mysCqGNlFa2
         gk37TtOfVxQ2ATjhNXy9e3r6FdELQwod4o+304nWCMDrv/qfcWO6QKiRd6lhLaGtvSUI
         CYXw==
X-Forwarded-Encrypted: i=1; AHgh+RqCIz5lQd+OYHyLNLorRLsZJ/hyUhxKvrc9L2oUEceAxKrr7wMXxKH1OmqTmNT7hP8u383llP/3HUS6@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo6nDzUqqnmghbLvepP7by6KbIzvbBRp4vlJ6ZlyBdAWUFd9XV
	GqMjxeD09Iexp6gdgtjNUvMY/6wZO9DEyGNw0Lm2ccUp89bQJykvw5RVi2Sq6qxtk8QRPifbLHi
	EPKfFdOWxgbzhg5a8JxSA6WME+Pz5BZcyASvgIwfffTGw9zfWO4TB7KdZSkCnomC1
X-Gm-Gg: AR+sD107p//F14pFaVjbi9BoQ0+zQjBJXwlGVyppgej+7mkAkufEAC+/z66fwARYHjt
	tcpSgJL+eIKwdKsJ3PiojqUsbpIVOHa+vdqcplisWLFdFX5UdGDm1uj78WiknEG+TjQIUcnSqPR
	67F2aZTjiV5I+vn6y+eA7SU1FXkRrEK/qI600QMht61BGUdH8leOIuyR6T6f5lTedD5C4ipOxE9
	xXC4hJFsPE1XSWs10kx+Afz57/MCxdfkv3RxT9+dxe8gJsunRHBtIYx9yaq0d3M5aviYXVGYoIG
	ZN00h7dSpIR3VGY7A2eHST3oQFp3GxqRoghmBCMF+1kZsxQACwINEQKfwX7Uy8oLLZF4VtCfnnz
	pTcTQqAkCaTRpRg==
X-Received: by 2002:a05:622a:598f:b0:528:f72:a986 with SMTP id d75a77b69052e-52b567dc777mr274873471cf.44.1785844284687;
        Tue, 04 Aug 2026 04:51:24 -0700 (PDT)
X-Received: by 2002:a05:622a:598f:b0:528:f72:a986 with SMTP id d75a77b69052e-52b567dc777mr274872871cf.44.1785844284022;
        Tue, 04 Aug 2026 04:51:24 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.37.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fe2f4fsm95228745e9.10.2026.08.04.04.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 04:51:23 -0700 (PDT)
Date: Tue, 4 Aug 2026 14:51:21 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH 24/28] arm64: dts: qcom: glymur: Fix swapped USB QMP PHY
 vdda-phy/vdda-pll supplies
Message-ID: <n3lu4rlwjzymwhdrnyrptsmz3uqemevgzhn7fsmo3nxaqtsgda@dkpqvwtnmlof>
References: <20260803-phy-supply-fix-v1-0-5880630cde3e@oss.qualcomm.com>
 <20260803-phy-supply-fix-v1-24-5880630cde3e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803-phy-supply-fix-v1-24-5880630cde3e@oss.qualcomm.com>
X-Proofpoint-GUID: PhJVv0zrkAxkpAYCEZA2wr9uLhl3vpqK
X-Proofpoint-ORIG-GUID: PhJVv0zrkAxkpAYCEZA2wr9uLhl3vpqK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA5NSBTYWx0ZWRfX7Y6cS5mF9lai
 vOPFKPmrrzkWdoj50iov7ui1jXYRVmCEQcRiwhIeqClvbPXns9PlrjRprdlVtOehjuui5/Z/ZKc
 kYzeGTHnkkkguOwksAVNsJ8s48HlZPrGKSolX47Dgqs/fSv12NhmpEVknYzQ/Oy1FcvnnVI+lGV
 uYbRncDytzB+wEYcs+UlJkSzp4gKqgZOc7chmLYaZK20hdbOD+fWv4RSIFY6oqV9sggKDVFR1qK
 uTz0y/GdF2srTaqb/KoZSKPqrR6pyGgQZlz1h+dHpGE3I09EvdOmSZ1bdsev+DY3aWkPPA4cPkX
 8T7LSp9i0mwXCkHk8IXEVpVPZXOAqL/b5D64sgECCNzqqDzyZ1W7EWqxvrduTfDDZW64VVS+Lh6
 Qd0FRK0+X/5wNCF6/YUGRDuGFso2mz8dpuM7depENFcRWOe7PWLkAPfhFf5XHXgi4GzP4DICcfc
 OAm8CesYpODHt1vlY/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA5NSBTYWx0ZWRfX70oEfYvXRKLa
 k/p43nXXgv2o1+/UArs88ALB/2Ky3XyYp6puZrYzlg7qAyCl9HdvldMKWU/AF3DeBUwse8QK7Z1
 1uu1K89ctmgTtp0dLTqEZtuULGKAiQ8=
X-Authority-Analysis: v=2.4 cv=ONEXGyaB c=1 sm=1 tr=0 ts=6a71d23d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Afnz6uBANMlDQL2PJxecKw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=OGV9TLrtSMBsBMb3FhMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040095

On 26-08-03 08:34:22, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> The QMP PHY expects the vdda-phy supply to be the lower voltage (~0.8V)
> and the vdda-pll supply to be the higher voltage (~1.2V), as used by the
> DisplayPort QMP PHY on this SoC. But these two supplies are swapped for
> the USB QMP PHYs on this board, feeding 1.2V to vdda-phy and 0.72V/0.83V
> to vdda-pll.
> 
> Fix it by swapping the two supplies back.
> 
> Fixes: c8b63029455b ("arm64: dts: qcom: glymur-crd: Enable USB support")
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Assisted-by: Claude:opus-4-8
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
