Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734AA3BCD2F
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788166014; cv=none; b=TjBiu7E3FFj3WG/qVHpDTaPgWSe8UqXAwfgSmcBJ5zEwbdU/szaxH9r/1+7Y61GJnObLXVXNvuDzaaYpjxteIE3JnklvAlEPp1+lWbaVIOvNFQ/oOCq03H4ixzAVA46sDSE41O5Ij2K4wRojuK54b3HpNuVM7GZmlRKch4iJMC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788166014; c=relaxed/simple;
	bh=hExccF+WH6nQV0fUgGSfQ2Rtf00rZIwOMaCH/wzTNVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tRgd35CHBP+xvlOnX3n9VWg+hvPt+aMEiUPdRtTde16YiTQ9f53H5befbNdTKDuYIWOSXy+PfkJATZT+h+Vx6Il2i4ew/1pKcBYs0+blEfNW90oWSNPgx82g3bVfWPFbab0b/Vy8wB6jHFaUaNpx7dXd84E9krwaoGaRsxMiuNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RBduephy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GYPnnOgQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RBduephy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GYPnnOgQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xscw1844169
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q34EOEOHDqhYS8JW/JGnDxv8
	icYMu4ByEPIuxJYSlZM=; b=RBduephyQ1PxH45U3cscOkY9uFLPUW8h2eMzJdQH
	KgWxAUMamlu0dNLe+QMCWBCmm9vhtuKURc7eONgltJgc+Ad2ueprNwxnco6vO1Wr
	jau0rmlQ/ksBHmoVlf+kauRipWoXb7d0a/8KLA9TReMVOv/wKuwbEexv5bo+Y7H4
	Cxy5rX1XZEhcO61l+/0DOqxpxT3yM58tBxGrTeXOiXnWe3pJkv5thkOeZZoTwrg0
	vymKxpQBZn4zKS3GZ/wcxff7rhTOK/haJQFrWAZmdGlDmanQ5uqha3Yv7MBLL0ku
	g0dpiAvLE8mL3B4s8jNzM8PlnekKD7MVosfUO4BbEXnhZg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrkgwb36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:46:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-933023a5980so667890185a.3
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 01:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788166011; x=1788770811; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q34EOEOHDqhYS8JW/JGnDxv8icYMu4ByEPIuxJYSlZM=;
        b=GYPnnOgQ8ZzEPwOzr4kXJuxbd5N7TFBi1I4EzSQOgyGuyMl0IZUTP6xWPZNqXcsGot
         K4JX0dYl+xrYn9YCiz5t1IqNMp7Mv7c3DWE+8n6yROoRlMYghX3WprfOD/fZ1iSc1Wr+
         ePm/REUqqKTbskn/6D+pWtPBjgdaYu6PwcNf4tqXS3D11wuKt6NoWgLC+WdbgJQAMpDz
         okSL4VFGoA2jxKWdg3eaRtFuXGxbvgJXPa9ohVzTfuuu/0L+RqbgKphozNXY52qk6Uyw
         k98Z7F2jlK+l6wmqhyfejul1kW1VtZqy1go+q+Ea0FE5neSBuEohT2CcVY+ZsWEKkPZK
         KW6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788166011; x=1788770811;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q34EOEOHDqhYS8JW/JGnDxv8icYMu4ByEPIuxJYSlZM=;
        b=ghdqMCysNX2RDn6zSeKwL2cGK4Vp4GYnSp6Y8njUS/x6TGymqRWbE3xqCXRtUeYaFQ
         1ThhHHGOjXu0TIEl1VxD5VsOm+w+ElS/K9kEhMjWlLx9y+e4MUZ1nEMyk+Bp81V7QTOn
         xvGBMTkv1ldHyeeIdDydJzgO/hvCaeAIGmqN1P8CaYOZpz8rO6kTkiwydlQdKQW8XtKu
         42c9901sSoiDo5+BnqlL7z2YxbYZQ93yB1OXuKVMF66BI6jRNMVMKI2eU5eywo3psoJB
         dg5CaTpsOaH8REuVOvuP/iYT9RINIxByHqjbq8pCsSLNuTG3VEWhxbxLPeercrMeXBUy
         3wOw==
X-Forwarded-Encrypted: i=1; AHgh+RrUGEJLlukTGwne3BKCD9AJIkbXSFkGjnJ9nA4Xl+KQ2fxTkPec/3VlVp4z45juc6UlfAnKeKWIStFt@vger.kernel.org
X-Gm-Message-State: AFuF++kZtomM7x3ZaweoTHfas5D8VVND5+zj8nZ/SIJh5wU7MzJ3jtUo
	ssDng9l2mIUE+X11FNgzhUk3wheFzI4QlOowwn7VXc73W4rHR7pCL4va+Tcx8Nk1CKsjCusTCDj
	TP5K6OxnUGj+3IlvLKodZIsbtvF+SuFslexA2g8dFumACROctDCOX5s58TVAFrK4h
X-Gm-Gg: AR+sD11ol8lUbojQj+5lHN5WEnYxVTlp6Lwi32/ty70AZJ6RAxM5ESHG6yjsaiINLrX
	ELEnqz+pzwCzyOVZ9ol2jtj7LOhZTbWqQwXlMQDHJfd1JwqaURnkO+p1nVE23S19Wn3caaa1lnr
	QP0mkNgkXizxfmF4z+Exqi69mQr4Zyg24GqFF/LYjrUzXgWDR7KZ/DZ8/9KIcAUdon7lyI5XOyB
	olXLrf7O1lNn2sGZivHpGymSVQaQTmdJOflVF3PBmEHHsqAJxMpgT3moCRViDrDbeNm9RHW+yKr
	wYnPCkXU2eNSBwe0hvhFXtV0bGu0ZEW4X/6L1px4XcECOV3ZVJR3AaHmDJoVgmxge4VVwDPFejH
	kVaPmAZxjmWGNaQ==
X-Received: by 2002:a05:620a:1b93:b0:939:e76:cba5 with SMTP id af79cd13be357-93913924eacmr2720200185a.32.1788166010768;
        Mon, 31 Aug 2026 01:46:50 -0700 (PDT)
X-Received: by 2002:a05:620a:1b93:b0:939:e76:cba5 with SMTP id af79cd13be357-93913924eacmr2720197885a.32.1788166010299;
        Mon, 31 Aug 2026 01:46:50 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cca3e642dsm160390655e9.2.2026.08.31.01.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:46:48 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:46:46 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jason Pettit <jason.pettit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] firmware: qcom: scm: add HP OmniBook Ultra 14-kg0xxx
 to QSEECOM allowlist
Message-ID: <yig7camoooy2pcvhuqlmwbbyxx3qbxyvr52jqeem7nbwoo6npf@nv2n3imnjaqb>
References: <20260830-x2-hp-omnibook-ship-v1-0-9feada71dc79@oss.qualcomm.com>
 <20260830-x2-hp-omnibook-ship-v1-3-9feada71dc79@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830-x2-hp-omnibook-ship-v1-3-9feada71dc79@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3NSBTYWx0ZWRfX2uWYjymWaJlR
 lvDuNMIVqDbZQvJmP098EYPnYHtm70KGBxjO9Kce0SgjwmVEf9Dr3PhutX2VLhHcGa55PLJrDaD
 nTtndwNJW4u1MjQs42tV+VyNK1QduZtKuBtC5GC3BVIn8WZYOknJ+xwJMveH0bWdm4BgzJEKewl
 8Xhr7NF8/UzItA04wWA+LyR/n62SFkCls0ok+JjT9d8PTzrPCSnj6ZmDqjwWr0d4YlsgX/oZqGg
 DLfbb2c4wjLUWUnOXCXjlD8IPl5lJyfz/zRXiZ9MmF0j58P5mv12/XUar0S7VKFhFYmm0AlJuyv
 hHL5QV0M0wSibEr5Lx6cc2GUi/+yJURfaUFYwuhevQEr8FYcOO9HD8ssCs33IjL5N7QywT2oeSy
 PTaAM3qG0ld3AFddbrWFv4p13W1MpBllENn0uBmerVfImIv33rmSYZoi1IYH+WD4Yhq1lHdi61o
 1XN3Auct+OIea1V3xEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3NSBTYWx0ZWRfX/ubLdFqdR02g
 /WBY6I0WYjlIzlzE9/j3V8fkhnkwoOpXkTD6szaydC4jbgJgYUdwngha9AdbNGcnPOrihRBzzGa
 qAW+jx3eRfmRh6sjjtwRR9PpkHXrJfs=
X-Proofpoint-ORIG-GUID: JaUHn5rKZ4lFlVUK_bODWO1pBSZaG8g5
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a953f7c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=zrKGh6FZpyt9dfM6tdkA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: JaUHn5rKZ4lFlVUK_bODWO1pBSZaG8g5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310075

On 26-08-30 14:56:16, Jason Pettit wrote:
> The HP OmniBook Ultra Laptop 14-kg0xxx is a Snapdragon X2 Elite
> (Glymur) laptop whose firmware exposes EFI variables through QSEECOM.
> Add its board compatible to the QSEECOM allowlist so that EFI variable
> access (efivarfs) works on this machine.
> 
> Without it the kernel reports "qseecom: untested machine, skipping" and
> efivarfs is empty.

This statement is kind of obvious, so maybe just drop it.

> 
> Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
