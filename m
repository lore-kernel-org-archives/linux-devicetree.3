Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1989F3B8BA4
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 21:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784669461; cv=none; b=LkvWQkUgaXVaz0ilDYTXygWXvNLiu/Oz43r5wOxW12uW6uycddiz0r+CUW34/Si2Y1Eh4W8dHhHKZPG5vvXZbrVRh9o0Bi2n1dV9gvR3eCvlP3Z1otXdv0M6AvX3obP787OXM2WM5YN6E5N6B+g+NR+L8EhQ1azlka5lwYuWI04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784669461; c=relaxed/simple;
	bh=iEfQyzDsdwDMUaShVucVlvmfkTYaRId7jK4LJS5wzNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nNsKR+D2/ehn5K3L/C8aULNYZ9hFyjCwyL6+0jwzKhVAmCZQm/gKhGnG2EJNvbOtTPcwbEI2Sj4ewxMhOoCBPe0OgRsSbFQDJo/NxQHnXzVbxLPI9b9McrkwEulDZdDYCKDSyJDbwTy5BpXc0lpYlOxwI4oWapb9RVq6h1Ugj6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NUrP2wTV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e2iXIqrI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NUrP2wTV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e2iXIqrI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LKlaRF2676512
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 21:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9PsGSpmXGAAZvBvyRNRBkErt
	fA6hYtUBGdoeWKOFN2c=; b=NUrP2wTVYSeIGwYQacw7gON7c9oFYDOPJ2Gd8xrB
	Ml+PoPrY4roX+w2iJCaMv5z3GO9h7aw9KWph8BgxPUfooO+OJ8sHGvYXI9qW29Xp
	UMFibcdn/NI0PYpryQWLcuM8QlUcpsSsXOkY6eU6auRIONnOJxDtTIQoU3Yc0xvG
	35FvO8rnD9fK3Yz8v5AWc2r0SKBy2jUK6FEBMva1tvXv6d8uQvIeecbouteSR01D
	+Aq98tjO8SxafHd0HpKo4hA2/6h9o79E4h/IZhXjj6cRtAWulD0At9zrGsLzMt6h
	+RR7UR/WvfC9CHM7AGTcX9r8xfySqf1CsJL6RrvBa++9qA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9c427bc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 21:30:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d7886cdso127396521cf.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784669457; x=1785274257; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9PsGSpmXGAAZvBvyRNRBkErtfA6hYtUBGdoeWKOFN2c=;
        b=e2iXIqrIwNkzDA1BCA4eZoB3oo5nENfLBwqphS+XrS3YcJij+R/5FRvUK+IcF9HHbj
         MiI42skGyRyTpoPbNIm329AbHTcn7LkdwQaJUZL7IKW3baFV2+YHvM5XAxImWexHi/Sd
         +6pU7Wo9gMWLrvsgACsWuzZJEgz0dMBAiLS1mPfVVWDovozgDjxBbN58SKW0dilhwuxC
         NmAXF7c3nRi1EqjNlly5AEXYdzuNlM6Py9tXVSxDJwvNkiRePjmnFVQ9R3qhvgw6VW4y
         Rw/P12VTdux/ouNJYtHu9OyilVwVr8qCGYVPqXbnedF0RvynujJ/QNaDb+9HI6JU50+I
         DRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784669457; x=1785274257;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9PsGSpmXGAAZvBvyRNRBkErtfA6hYtUBGdoeWKOFN2c=;
        b=MpUAzPcqkgNRMU84emWTGTpyJ5PJpQNrSVlsIXS8JjNh1hgHglBAVZN5AzSNXw2CqJ
         oKGYmf3xtgTlx+0ASn8Nxh6jH3ikSrXs+3ybrYd3Cj/D2AAAMF1WU1sFNE5kg4v942qD
         hDwXnIU4HFtrnUmnWRi+VVOrl/874w6TaOQz6PZJ/JnZkEQyIR5WO4vKOOa39ViJO3Ot
         R/rmmibsYqWn5/kD0x1Nru5VZhWIBCemlkEyMaX1JQ1UZVrwQ3ju3XEB8JuSaTRPGzIa
         daMNhTZqPZe9ieeZxdWSeXCLFsp601Kmoy9MqL53mtKN+M+u7cpk0RuG+mpRR9FLl52y
         ds0w==
X-Forwarded-Encrypted: i=1; AHgh+RoI9corA1Vg69MsWG7LZMjAilpI+dShoo/M3av8sHii+4oHatdq4tSShVNETSwiymL1AFzuYnW2pbsi@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9+0z9EbTCQTsXJ0bvVQGM92B98eQKSNnjJMTcyNj9FpTBn6cI
	y6aNCRxYg8xP4Ah02IicYdrY/akbY/Y0HoFvfSOpObF9zZx8JtZ8yIH3W8m7oJ7vLg3+rz+QUJ5
	ZzcXStDpgnzGh10GWKuNuZ7rFSFegq0z9HtRBj1jBZohpFyi/PjsYrNFbu8gwcQ2l
X-Gm-Gg: AfdE7cnOfuUbUhb/ODdqsArmU6vYE+/mS0Q6XJvo7rRD+ML5BMa/8JMbQT5TDAoeGc+
	VRHFrG4ppCx+YxYuyluZCIDS2mbBWHh4UWZL7cR99GpUycIqOzRKIvmYmVBmxrHFn41lr+RdSVU
	vKZLc9mBiHbwGWIj7EEXUOkT9epZZAYQGVZ4BNPZOwO6K6zdxsDZ/8nJnhbEyLF2t26cm5urFVx
	zhrQobIifV0WUfr1kIskV7RCtOpDGn6a32Ha5Xtp27RAFyY7xbXkYLESionPo0/WwDRGKpnr4yH
	HLbdgSd1LycZpV3nxtBwC9oDx0GdLyJXVnSMN8fl3hnB1gnpl62YXyHkzPjQ/01mXeCBxuE7hBB
	o1KSzKPtjvQWQ9j+FBQCrONUEWC5XqURmS/RnyWakM0HGeOO/R+dHu4d1GWDUnqXSRQpqkPsS0e
	7iVZw5Rebpa5Qe1Q==
X-Received: by 2002:a05:622a:1cc4:b0:51c:9c2:99f4 with SMTP id d75a77b69052e-5213cdcc8dbmr198082371cf.64.1784669457189;
        Tue, 21 Jul 2026 14:30:57 -0700 (PDT)
X-Received: by 2002:a05:622a:1cc4:b0:51c:9c2:99f4 with SMTP id d75a77b69052e-5213cdcc8dbmr198082021cf.64.1784669456736;
        Tue, 21 Jul 2026 14:30:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d4353csm117321e87.57.2026.07.21.14.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:30:54 -0700 (PDT)
Date: Wed, 22 Jul 2026 00:30:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] firmware: qcom: scm: Allow QSEECOM on the Glymur QCB
Message-ID: <v4oqlsfuke5rlhzkwdlz3vovpudzice44jhyosur4lyz66myn2@ldcw3qz72qlz>
References: <20260717-glymur-qcb-v1-0-aaf1cff84aab@oss.qualcomm.com>
 <20260717-glymur-qcb-v1-3-aaf1cff84aab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-glymur-qcb-v1-3-aaf1cff84aab@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a5fe512 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=IXoLagY9VYqCqr7K_xUA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: rdgDvUAgJKJWbHjiBUqKte7H4uPEJ4Lh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIyMyBTYWx0ZWRfX/EZyejIOyaxO
 cyiQdcSJ/hIcLrjXzAE0LFvGSNNr0C6pqOv0EoCuY7XDIcdCHaELPwzUa/DOVHUa6cVRNxxAMgO
 Y0VkhoWNvYA7RGK+/LK0JcEjZuDIVFLkfFFK0YJe23EoB6FuOkUhzcfxGEkQocPEwKr4SGSJUMs
 D5Q+0SiqY7tuApAThSh4KGub0R5HD6gEqsW7pN8PpWZx+ZlGNmHuHu/y8JpEWIZfT//Uii6CzVS
 OxYqt+QC0I+XJR55XsSRAyqqlIl4oD7IuySm4XxE5G9N+8cofcPvMj1ebokphrTdu5CbpgGbKnr
 olqdF37VlBBWvb3t5TlWDs85vh9IbqzB4JWNfx2am9xKB6SzkXc3qTSEe2fiaa1v6MpZilnXhoS
 c2OFDhKdmzgJiiei9l9x8Te3bP/B5//M6Vh72/KsgZ0l8UtkuSi35GIhS9x3uekNcRGjMgwHesG
 F6CekdmPEk8GvTX3ihg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIyMyBTYWx0ZWRfXyKDb/Rg1nRpU
 3r9pkC40cplJ2drQJIkoVE+HsFpyOAWrXyss0Sh6MZgt9bWgz1A5tLLLS6MmdMdMWA8m7ZYQB+t
 7/8WBVfj4Iiz0y5U6ntuqseUp1TdpZQ=
X-Proofpoint-GUID: rdgDvUAgJKJWbHjiBUqKte7H4uPEJ4Lh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210223

On Fri, Jul 17, 2026 at 04:54:11AM -0700, Gopikrishna Garmidi wrote:
> Add Glymur QCB board to the QSEECOM allowlist for enabling access to
> efivars and uefi bootloader.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
