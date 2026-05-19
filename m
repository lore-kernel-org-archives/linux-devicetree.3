Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADC7345CBE
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779186862; cv=none; b=DYOXuAk7tIo1reZoRPiPFVMZE7VmFEITdfZsDn5WeWMHdrVt8NF2y2dybdrwz+4ndmsuLSB6OUe+fNkx04vjx5e0RHJB93kIKL8XwjDw1/G/nVInVQ2XUqMf7hrDKBvO0u5xpSeX63iBxH8WCQute8kBDr4df/UsY/ZrQ2PjiM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779186862; c=relaxed/simple;
	bh=AxrschLwBHDlVdHJM3psav597BzvT8GiznTe2sTYbwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eI8BwzteRhJcv8F2Sv/mxG9M/+d8BHhEOig8HRygLoSgKi/Y71gOn7n8f2GUGumLUGvcB5vPi5KLatCa7TvI5YNxXL5CqBo0ydaAnMa3cIxJdOywwCKBcFC/Gx+LqVuhaBzy7EdeDeocQdtlpg0zC3CUjQC0v5QYEJCGgNgihXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oFtRawkX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fo+SQTHO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oFtRawkX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fo+SQTHO"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9v46U1054777
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LJrtjiJ90USbs9CvKrw/UyUm
	vdyx9+SH7BWj4/0e3LM=; b=oFtRawkX8BYtj3jps73zNucYH4l7WtxoWfUtiuVo
	5r4y4XIS2+zUAXywH1vbtDuqSjgvh0u0NztNdmyqR7HvV0t2PsgzIKJwDn67jhgB
	qhA+TJr134JiIX98SWbBCNQoaN9/8UykKYTguy7GXPONB3z9VJQtDU+YXAQ01Sp+
	Ufe+9xZM3XEZECFY1x8pVO+MXN5ioCyxZur+4fhwV7rk8BnM3HA/GT3Ny4U84T3l
	3tpS8bQmmWlT6cMhMQPg7o5Jt3PUe5VzGhVS1gZdFkOItZ8yL4wZ92I1UaX93trM
	gfoscJAlBnXAtMJCcZ4JnxUDWoDEF7nLVnK8HNZs4/0LFw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8npar4r0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:34:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d5d1c2289so105405401cf.2
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 03:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779186858; x=1779791658; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LJrtjiJ90USbs9CvKrw/UyUmvdyx9+SH7BWj4/0e3LM=;
        b=Fo+SQTHOrbGxUgso8sMZG4+Pl98j5TRHt05iahBnDeEretUvpZ9aaPmDrmJwOYNj48
         i0GlhlkTWvOkL2c+iAYjH3vFgCk+Y7CYds81+iSlmJ0tuocjzqnUD8pxFmmByVf2tuza
         jD7SWleL/aQ7h7vkE6qPrm1CXasM4ofYAtdY2uVu8uQwamlItd1GAczUXuSGiuSjMWcW
         L7oRiY2vL2i65LpVv413gQdHQ/nSXwZ+zwJv2YXFdI8ZseWyucJIh6tnlPyAsCdP/xG6
         moOGICwMOBN6Bgo46gPsTaL1EXjbZiupW0yMpregtXp2p4oW5lCr+/6u1oQL34ZNCjgn
         /Y3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779186858; x=1779791658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LJrtjiJ90USbs9CvKrw/UyUmvdyx9+SH7BWj4/0e3LM=;
        b=U4/5gUuiyFJtONNCsCbmYy8NOr5rim8mjpNDoMfGuSTR7T2Sgz5qsYtt1h21IHJqdZ
         587kcjnqGECTYfz6YOabwrBw7XabSmUF3npDrfMUQKB/b+ltJ92TAhSxdSysXh5A+ecd
         soSwBkLXyL1jryQ/J9XTCuo5gZ4pyopwHhTbWQFYEZcFK2rGhFzyymldjhbhPtFjA8ZV
         4VANwEjRxHW1dRWI9BJ/wXk5+86o27m06iaiXFTOXQhSkVASK1S7cG+eQQVpL3WybXKW
         wtNkJJ5EGGtqkV8YjfpvQ+GfmPI4NGrfLnrH9JDzYz8ceDmSNsOLU4lpMfbDRNnio656
         5W9Q==
X-Forwarded-Encrypted: i=1; AFNElJ9p9voSxY8YaZTcylFnck6UrmsYwazfkleuK7rbrUPjhJ+4BG0u5mhVx8u6ST9CX6T0ARV3YDSSdc6p@vger.kernel.org
X-Gm-Message-State: AOJu0YzIL85VSchVOyFBi2M5APuSBizBetEMSF5SUlyc6yGA4k02zMI9
	LSwEy7jhCnatsvVPfRaJkbtYhXiACq0b20RZYajs4PcMiruyVdpnQ5qlOE3W0n8kfFfxMsi9ewK
	8fJRAfDji9Ji3+CIV+0trC0Bz3V+RlYDXeivrYgxRR8ka5TKu+Aib6+eohPrkXNVJ
X-Gm-Gg: Acq92OFXV2IPVYN9vJY1tY4tKrDqjlxUfBjUHpW4rbiogS2J4kZ3QhuBrB/Uii8rv4/
	RjEBBPPmItvnZX0ol9uIotk0/6xbS4f8u/0t9n0GVgGD54wwuKGqBoVNNsvZs9f7FYkKkMG9abz
	ouEZLeUT0MH3xV1hUqu8qK9pFmVdhuESJk/rafdLRtv0FjDRE/xW+EEA3YNQhGQMVdu6DIqF4Du
	DxoaYKwfcVkBaaIXN4TWe0DKzLLTTdQpTXPv9tSnqr+uk7U78e1TWZywSydecBgbKFdDjY7/cKt
	hdVtj6gzSCEDHsryTvpnRk/Gz9yKsrVlhFiVbFvQGqLqqwW+bHUe8wkG6Dce9v1pJQ52sQcZxhT
	VnKC3JlgznZYQilNBxXRxTO2orXtC5VCT79kpu60GNHmeCEJLFgejRHzPo9YiPTMSoveHJIYoeF
	do78B8PxZzRXO/UZ8L1nln16PG+m45idQra+E=
X-Received: by 2002:a05:622a:411b:b0:50f:af6a:121f with SMTP id d75a77b69052e-5165a26b24cmr259071351cf.56.1779186858340;
        Tue, 19 May 2026 03:34:18 -0700 (PDT)
X-Received: by 2002:a05:622a:411b:b0:50f:af6a:121f with SMTP id d75a77b69052e-5165a26b24cmr259070841cf.56.1779186857860;
        Tue, 19 May 2026 03:34:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3958874ffbbsm19057761fa.27.2026.05.19.03.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:34:16 -0700 (PDT)
Date: Tue, 19 May 2026 13:34:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: qcom,pmic-typec: Drop redundant
 port
Message-ID: <lzic5v7zdqly6z2tc7ddvwkhau4toaoq7vavbgqll5smmhius6@bpcsn2vyjmrx>
References: <20260519100014.282058-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519100014.282058-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwNCBTYWx0ZWRfX+ddaDg22c1l7
 pHvroC/ObjwFRjPknaIfU45brfEGLYWb94NQkvn1pNQznNmWAD1FqazHYJep8ZFIKkPjmKTcTWs
 O7/5zVtHpPtWmciJD0HIudbzDC6xDqSeGWTaFqDalSmIA1bohdLCI7WxQeJNaK12+i2LH42yWlZ
 p0xKFqgcNe4QAct2Syzty8sb1OvBPOMYOVZZC9h6MpuvKViaPbNW+06fC/LgMqzLoHA21T5a2/m
 bstm6w6gkY2Xxj1ay2lsmSxzGfRw6RPduE/jJFBWYU46ibuGrxIdTCcOAg2hdIBd7/cxaSngSd3
 a9QysiX3JYX+tBggX22sip66ReAbR70lAjIrZfyYBqYe2Nfskb+x4W+xNBpbGN+ztiy9NMuGd62
 V+ZHjoYePlxcfCRxGdUsQa1rRnwdL9pStlUCU769qz4vSLg8STOQckoKxtXMdP2vPQuRGKB5erI
 7j8+q4WdTEaPIEmIH7Q==
X-Authority-Analysis: v=2.4 cv=NrjhtcdJ c=1 sm=1 tr=0 ts=6a0c3caa cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=nMIgit4TKir8xPiZD48A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: gjKypgZysPd1kCD2iyhAgY0300zYAD7R
X-Proofpoint-ORIG-GUID: gjKypgZysPd1kCD2iyhAgY0300zYAD7R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190104

On Tue, May 19, 2026 at 12:00:15PM +0200, Krzysztof Kozlowski wrote:
> The binding defines both "port" and "connector" properties, where the
> "port" is claimed to be for "data-role switching messages".  There is no
> such dedicated data port for this device and role switching is part of
> connector ports - the port going to the USB controller.
> 
> The driver does not use the "port" property and there is no upstream DTS
> which would have it.  It looks like it's left-over of early versions of
> this patchset and is completely redundant now, so let's drop it.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 5 -----
>  1 file changed, 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
