Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515139;
	b=fwjG/aVocNm8GzABZLc6N6oIUMQIDWh/PG/YNAsCpWDNhVMO50zVAHePg0Fkex8m+ma/
	 o2tjD/aepsSVG/Vwc0RsnAju8B7t/KGu/xGmXN1W9v0IGW2brBupRPlqjMjPeT7ig3xND
	 ieLMUw3XhNdKgXyhTvisNCQWhPpk2SaeTx0MN9AcnYwpA1/+ClpOUG3lb5pxF8g4DK81V
	 4CIzeo3D47TSO6AwMzfeyBEheFu0X7BdrRwdmcXePMNecdYhWdKJT7UqSZyEa/bXS0rcj
	 5qhGmNuq/Ge4khl/kquwHzwddeIF+jafFoE8jlp5q0EzooqQOQv6/+J1bXdV1XXEaKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515139;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6430HUVLr4bJNErHixuqanXn4vXMjYSsZt2lpy71S+E=;
	b=v+4hV8CRR8fexbNrs7G3Y+vhVnyHOua7NTWWH16EjskLoMX/zGon4j67jezoqMBuG+t2
	 K2tgJjqJTbGrq6jeYsS+MNUv9ng52+bIpZYclUlR+ltiLqLCUtyIdcOBzRENTTFU8auUj
	 aG2oq5zp4yrymHc0mBoqRVUvKt6iNMsEzGxfcJ/xTnuW6X6qVKN8m8jMHOUUajhq6NsQL
	 QvKjuuwshVh4w7EEoPp8c+N8Yd2Af0zBdw+2gfsoWhPTZji7uYk0vgx4D6o2jcU+E5SBC
	 4dJWqaJxsfgdGyLhihxkTPBJ8/RjNurtc5yNDBHXVrPlzcaIzkOZ9QRrGd6hswvbGcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mDrQH1Cf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NxbjnF6L;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6D4606A326
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:12:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D6D4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mDrQH1Cf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NxbjnF6L
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8XmQc1598157
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:12:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6430HUVLr4bJNErHixuqanXn
	4vXMjYSsZt2lpy71S+E=; b=mDrQH1Cf6c5ArPYtVFC33gvCPjdAql19E0mcdVR/
	9eqGgLp1GL3Vki8Vmur8tiKY8Tn+bT42atKTgCAIYukJpTr445Zd7CxjjLMXMioz
	VcFvRC4AWT777uNSpCPXx/rj2vHaQW92z6D+IUy7XRTIKqAgBak1a118zSetM6vd
	qY950+G8ey+vTkpD9n420XWMzELeA06V0qkqT5wCjOxDk9qgp907MGRE8cvWRxJW
	WMmIrFOLrfJVT9XfgQvZcoTfUck6eJ0ynjpHtccprex+0hvGPA1gvjFBHC1Ufu+a
	kCslzGU3S5botnVMrvR7NKdFc99pgUfswLvi4XwbSUqykw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqk30b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:12:18 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386ad819860so1814064eec.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 02:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795515137; x=1796119937; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6430HUVLr4bJNErHixuqanXn4vXMjYSsZt2lpy71S+E=;
        b=NxbjnF6LwQeuu7VkXngzE9TKNcxpj3cN00Rgxs1BVSnT2oQg9ZamRLfNIxX7tGrDNl
         XVORXmmg81izAhNMDKzPlmTShbWDgw9Ghf/c7sFHr/jwuSeeKqKVihzurUotH4PclA0R
         +ASQKFamgg4h43T1y1M3mxCCWhqkgm2DHe96FtExyr2RhHOQao6FvmSBTOBNqtSS5K3Z
         I3uSNubetg3mZN5OXJQWTUSYvQ4Noauq2JSku4qnq0a2lK4fce9xXodzG/fboAIiCU7F
         ySeWKwUt/MX29jiWrZMFvFPetFa413fbLYsRVLjoGxluUVQZd18zaLt4c+nlOuiVp8Ow
         VE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515137; x=1796119937;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6430HUVLr4bJNErHixuqanXn4vXMjYSsZt2lpy71S+E=;
        b=SNQmY0Cr6zM0RT7XkSg9fWujBNDbXcYk0OK5N/XjTUg/UR0b/K/UuzwWC+2uDnrOP6
         JU6ESU/CKa8zmlion9Jae7EwutG9hVMHZ1zPWATUUJPuuXkYLgNKXI7cq9jlvR1wgJpP
         VN8r4X3Upp7khTpeAqxD3qwjT1t8zCIYDZQGYUO788DHfOVtqt0NQcV/dgvyST/MyCSD
         villuPMugDymHZ4KCiogvPMCG3/euWtZsdaqN1sbodUqbDQtVkGb68kE4/VF39D6tOA+
         ROX7w1ZFhg7vOQM33UHtCxlk81RFg69j0n9lJsixCJn7ttAjv15AMGAVqeSsOpQX2xAn
         pN0A==
X-Forwarded-Encrypted: i=1; AL+hErG/ckixny9n6D7ebIqOmP5iAiG6LmQ+zxOvA81Aed2B2KgrQR63UT0y+yFWgG1ho6XUNqt7VXPZTKHz@vger.kernel.org
X-Gm-Message-State: APuU4Z9lQ1O5cCysSq9syxzPAR5+RN7bMuaE1vrdeWH97QbFsjrFrhkf
	fW8h8618neqYBAJtAllk+z1JjBjzqTXVU++pSvSvr7PDDRRqg3mviZ8g29gURlb3fVCGHkFI6g0
	e55bucqXTJTjr0kDbEJbkI/rMhXablWBYY2jPjQBxuuH0U4j3pu7uWOS7xml7bZ1q
X-Gm-Gg: AZFdTZeOiMi0kM0nXYXxcFDNohEdfVqsBjN0+MADOtkjR8ZqVHCjFjZIhZ5lBtLNSS7
	nFgE1ZqV7V8sFaYVdVcSBGRyy8Rp3g4BN5KjGLoKgLsQVelU3uch68n4Ik3yTljckhWq1wpi/jt
	ECNn8BWjtyPx4PA04nFwi0e4XzIlgXNY3+1Va0HQxFmFuRPk4CAxU6ChQNc8sumQZvfbFNjpWUF
	zem4I0xL2sSR5RcyBru9lxOgPhKJSRR3Y/F24zJ0wmgPwPo+CTDrZ0bx+WLX28uzTOWHcriroau
	ckDhZYWZLPSHy2ivST4YXWCnsrBb2PwWwtRR71gTGuMp+n8SxYHbGZa5283kK42DiZdT+FaKuac
	ednjLxnexKty9sQipraKSBZB3X6ssW8Eru5P/tZNJthhum6IzTumTsLhXnm4aXoPLd8IZra9XRE
	r5
X-Received: by 2002:a05:7300:f68e:b0:369:21a:dcca with SMTP id 5a478bee46e88-3856e9472e8mr14256331eec.10.1795515137027;
        Tue, 24 Nov 2026 02:12:17 -0800 (PST)
X-Received: by 2002:a05:7300:f68e:b0:369:21a:dcca with SMTP id 5a478bee46e88-3856e9472e8mr14256287eec.10.1795515136350;
        Tue, 24 Nov 2026 02:12:16 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm10543902eec.9.2026.11.24.02.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:12:15 -0800 (PST)
Date: Tue, 24 Nov 2026 15:42:07 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v7 1/5] dt-bindings: remoteproc: Move iommus constraint
 to SoC-specific bindings
Message-ID: <20261124101207.24nzbmb7udaq4ik6@hu-mojha-hyd.qualcomm.com>
References: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
 <20261120-shikra-el2-v7-1-9d9000eb50d4@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-shikra-el2-v7-1-9d9000eb50d4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b056302 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=_043IPGYQ-q8YCy9JWsA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzOSBTYWx0ZWRfXz75ZukuWRrGy
 cttTmwRGrnYuLTRI+Fi5k2MElZzO0P4xEZa35W57c74MItjtCD8xRzUpZqaoVsOK5rV9mR2aXj3
 SB4Axj1PR5VrpuWBMo0tTh2SOKFPFSumLnZ57si8XneUt7ENfbZ7ASJKGT/gjxdpUKOJXKIEk5m
 yqLCyzo6CNNMQPkEnoO9g/ARo6BxKUtNKM2OxyivpfC3vMI3pw9CNCZjxpFBk2TxLc5NEwQZUJl
 +2WqCLEkfn5qcdIeZvNU28yaGxkqvXH8CyAsJqSURsTpnOBq8gX6IyBSu/mFDJfowWPRr4obecO
 7qdAabVUAwti2R6HBs4jvHT8dEyHYnlBGtBIM8UHNLEwX1mxkt5fi2IR5YRAR96SMGJpqz2y8aP
 MFkLc0DtPU4u5lhcy6GIrJga8VPc8EEokWeoVurir04YBAqsK4oWolIRFslAi3HXUmFUPk+4QtV
 CdzmGn18F5LD8Tjtwkg==
X-Proofpoint-GUID: ktTk35IA3IzxVXsrNO0NgCDImKCC4NzK
X-Proofpoint-ORIG-GUID: ktTk35IA3IzxVXsrNO0NgCDImKCC4NzK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzOSBTYWx0ZWRfX1hTXeIATKCpo
 nb+Xc2Kya1Xshv5yqV6sG4l8Ks/+crKFlxDW+lhAKafj55R9ekhW5b3CYAaLGHfOrjNMyIVWuL8
 KC5CWgs23MeaePWrjSf+Ne32O145mw0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240039

On Fri, Nov 20, 2026 at 06:50:49PM +0530, Komal Bajaj wrote:
> qcom,pas-common.yaml limits iommus to a single entry for every PAS
> remoteproc binding referencing it. This is too restrictive for SoCs
> whose firmware uses multiple IOMMU streams, and a schema referencing
> the common one cannot relax the inherited limit.
> 
> Drop iommus from qcom,pas-common.yaml. As this removes the property
> from every binding referencing it, define it in the top-level
> properties of each of them, with a description and the same
> maxItems: 1 limit, so that SoCs needing a different limit can override
> it in their own binding.
> 
> No functional change intended.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Thanks for taking care the suggestion..

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>


-- 
-Mukesh Ojha
