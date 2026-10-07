Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC624279E3
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 08:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791361528; cv=none; b=AaeJz45nqeCtIjb4v8R66C1omOv/lmPtNIP8xNAFuuaDc2ndh2rgQ9jAbmLdQ1tOLGpMsIvcCscM+rYhs/oQWzbf9bhL4XkFhIxVgfTHPXXpvgayjRIIQWyfhMY5bHWMY1XNC/QhQAjatKYiOqAS7oyS7LWjmSHj6YUMfrSOM6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791361528; c=relaxed/simple;
	bh=ZDYszNVEjElmxLR0VTjx9YRTaDAmAgUHSJvjzGCh0RU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WA6JS8l51vfGdPSDcBpR2SI0llIJIL4/E+ALaS1XjoYW0NPjMFG79zzoLRjjzu67A6Gt97/O9dGOlNeiPr31FEBYOeAfCInVHXAw9CgTnTNhz2qiMg3ED4nmyraZEHjE37Q/UxCOuJ2vzkkX81FODzauonpXlugd43fLj2jp/74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HacJ4tN4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kO7qGJug; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HacJ4tN4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kO7qGJug"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jXkW3810929
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 08:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pQBG5SbwlH1RkPs7F97Dw6PI
	C6xi4Vl8Iw2NiJzks4Y=; b=HacJ4tN4Qg83bgXfxkrxXlkf0wf0zZ/QGHe9tA6H
	YS4KXyMLf1TCaQ6GyHXpbbtBEfiXaWGJjRP4KJ5sAm4rh91gENY0Rgz+3drn1nN8
	9W1VdaOByzp4M3ZEDdJsytQp3eYK3ebhhqMXEiukrZbjw2kpp++/3EM4ASnABh+7
	wgY0opeshwrIzYhqiM5bAgJmvJslw9Vbf7CGaZnYXNjkBPsC7jXzCae6wG7DSbFl
	TpHnKjnOLi5QYtRjjdn+ANXPR9WxgPus65/AEhXGIlH7MpkeOtAHKdAv+JJdiudB
	MquMgxXuIwzOlKXyo2E9M3JXhnONimoyoYVuoSM5RNRBdA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5gvrrbw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 08:25:26 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3510562ef98so5145571eec.0
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 01:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791361525; x=1791966325; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pQBG5SbwlH1RkPs7F97Dw6PIC6xi4Vl8Iw2NiJzks4Y=;
        b=kO7qGJugi0BVZnH9scWpwxe9vPW7k5uK59bo+DLueD5W/tjVMDNd1sum6cE5fVXZxj
         Cfn3LP3rsXHqZAwDhBPrrQkPz6zXveozPb8vflqF6PxwZb08dqYuatVTpuOeA16JfF5N
         h0xnFzthkEnflEIO19/bm+8TP9sody6dAi7+rftB1fgtXYrEtDPWOMHEGmL527BB4zFo
         xDqzG1sXm+cpeupohaZl8pt7tWQcqpgbdzDsjqsxacQmfxnBOuhnxPYq+MTWaFtR9k8y
         3wQ0BLD8am60PNkKJC6p1MgqI6KoynB8Ked3RNxl270nkVIdj4e/ouLF9rwClgjOGqAi
         2/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791361525; x=1791966325;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pQBG5SbwlH1RkPs7F97Dw6PIC6xi4Vl8Iw2NiJzks4Y=;
        b=l+OGigsf1qJZRfew41oVeSZVoHRcbvHigJqlCL0Pk4fL+HOekzcR80NOmozPuMQbRj
         XbJmnEpKfy6anintO9rOsUxRVyXEP9LSBaQno9mWi4nIi7bcR8Q5m8To88itAYPKUDCR
         dBlPS3PKV9UB5Krv7jTkFuumTzHlVlIrEvvOjRZN3Xbfers1FTw692EREcGLmcSXyPNU
         A9zHZaY8ngYiCp7Jki54i+DwzGit1BpQKW2Sge4KBosIjabBZiw5tLTgzpo2GvOLfs7x
         AStFRA8LS7b7PBrRoyduS3/tf/Y/QkQWQ1Bx4TJepqTH78TeWBKrtyNry7SJDBNWJl4E
         Dtpg==
X-Forwarded-Encrypted: i=1; AKwUvBx6NijtVrRDMPHA6nk8zdZhQNAdS/e+Xl/r7RymkzmnwykFg/ekAYZMX7IIoN4lvZMtDQ2DOSOX2PDj@vger.kernel.org
X-Gm-Message-State: AFuF++nYgPcx9pKS2XZ1rc4UY9yU5cwB47+FehoTO09aTsxfELiU7l4y
	mnu0Cfxt+/ZB3nq66mSe4TPbHKFpwIuOR89kMJ8bctSTQ9S8Yi4V7KqTzoXnyUIERssMAwKrY5o
	TiuM+Csdg7xdMJUSXdnftzNE37fikfrjoDfnR4KCZin8S2d4mxtiC9PvsF1NwhFyP
X-Gm-Gg: AYBFou1QT1vN32hkDYKKVGyP0z42auflufor92j2cXxAuYxxxNGtNkisLlxoC6iwoOZ
	OKPmM/Hwndk4MTI37mRzUOc68V2mHxKzBAkMcs0ap6UYiZlKpOdCzN21wmPkp4ixzC4g5eoem/H
	575vqy7HxEyB++uWm+6lO5jSFOiMbH9Hg5oqTrBxkvqYLwdtFZKBHhH+mc9Iqy0WyQxhAA9iqgT
	ZwRQuTM5s/z+KF8iIgpvHVR7mTNOoQ+a/BSBKYl3vDrBQtwqGddRWxB+85393ntK14Z8NcyaaCD
	LIKZRcjsLWplScEoFsVN6S0KX8M3WIegMOJVazBgcvvlI0wtOGX/wcC8+g3ti8s+ytHP0p0vSE0
	smPRoSQCvDA+HNpDa8c27uCwxiQ==
X-Received: by 2002:a05:7301:32cd:b0:34d:2c1a:987f with SMTP id 5a478bee46e88-3515de554a1mr1487957eec.35.1791361524847;
        Wed, 07 Oct 2026 01:25:24 -0700 (PDT)
X-Received: by 2002:a05:7301:32cd:b0:34d:2c1a:987f with SMTP id 5a478bee46e88-3515de554a1mr1487913eec.35.1791361524067;
        Wed, 07 Oct 2026 01:25:24 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aeb6013sm5961752eec.5.2026.10.07.01.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:25:23 -0700 (PDT)
Date: Wed, 7 Oct 2026 13:55:15 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 1/2] dt-bindings: misc: qcom,fastrpc: Allow hex digits
 in compute-cb node names
Message-ID: <20261007082515.xmjpa5jjptgrl6y6@hu-mojha-hyd.qualcomm.com>
References: <20261006-glymur-dtfix-v3-0-44e2bc5370c2@oss.qualcomm.com>
 <20261006-glymur-dtfix-v3-1-44e2bc5370c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006-glymur-dtfix-v3-1-44e2bc5370c2@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=W66txhWk c=1 sm=1 tr=0 ts=6ac601f6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=QGBbWe6yPyKI6YAsb-IA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: ezMclqKB8A1AmlERmzs6izJ6nTUKRLpO
X-Proofpoint-GUID: ezMclqKB8A1AmlERmzs6izJ6nTUKRLpO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzMyBTYWx0ZWRfX4v9kcXAHFULT
 RP4fbUjIWAiZfFhPznHOgnqU5QPzNASo3AxkqvusBw6VQ177Q3Ot4/JUJtxOFMHaR3VYV1IgCcW
 9d8ntTNtYX9sRgeg9FyzVAl0xKiQKTyREHuzduxUKjGBx+NB0gnU2BLU7uMaucRJBDEYWnFDxzp
 9wh3lqTu/mV3koSMewGARGHjDI3t5wkud/gtaGClhEYnuRPhzCcpDZMkZSO5S8wGr9K7jnCyFld
 ImH4QAk+WWLZV0Zowz653L0tC1uwYPDezI+No95kKTJ0uixWBUhOrfe+PHArtHGprzBg8SVu8zX
 u7xFEuSOIfhTKrVXlcdVWIYzi3tpnZDoKjh2XnuE8C8GAUzfIdumDDFrcB6obQK46M/jwXAGWTc
 JVcPqYnwhN35oWG6zm1a381XV/5BfZxUL40RN98Qy69P9C1y810w8w9U5+7XHdG6vJWagmmr7qc
 CfLUnDLZORBpTfA++9g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzMyBTYWx0ZWRfXyCZZ1WU7KFoD
 UKhdIpZz1KyFqc9MjyL+S2iKkykUeePyiwNUEpDYi5utEVtukJHul8opFVhwILUUnzWLN9Y0JlL
 /OZrR4Up3e7QVUEGbw9Ykw3MXLZe5QY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070033

On Tue, Oct 06, 2026 at 03:56:06PM +0530, Ekansh Gupta wrote:
> The patternProperties key for compute-cb subnodes used [0-9]* which
> only matches decimal digits. However, per DTS convention, node unit
> addresses must be the lowercase hexadecimal representation of the reg
> value. For compute-cb nodes with reg values >= 10 (e.g. 12, 13, 14),
> the correct node names are compute-cb@c, compute-cb@d, compute-cb@e
> respectively, which are not matched by the current pattern.
> 
> Extend the pattern to [0-9a-f]* to allow lowercase hex digits, making
> it consistent with DTS unit address conventions.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

> ---
>  Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> index 49d2a5e8ba39..14fed91fee50 100644
> --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> @@ -79,7 +79,7 @@ properties:
>      const: 0
>  
>  patternProperties:
> -  "(compute-)?cb@[0-9]*$":
> +  "(compute-)?cb@[0-9a-f]*$":


While you are changing this, original change had * which allows
cb@ as well ? should we make it to "(compute-)?cb@[0-9a-f]+$":


>      type: object
>  
>      description: >
> 
> -- 
> 2.34.1
> 

-- 
-Mukesh Ojha
