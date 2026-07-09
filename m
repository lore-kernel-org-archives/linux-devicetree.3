Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E813E7BCB
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 12:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783599328; cv=none; b=WNRCZ+o/3RqmPEdHRECQobsE5k5V9ajCXlsNARP9NuxzMYNXWxAOuU3L5i07ArAuAZdb/KnOZGPfRntBbJH7mIYDSA7giC7RzOxpeM0gvJCnb0NrXjBYZXcI3urA9oCPfSNVQ9jhLR8cCrWb3k8qj9FYCfKYIpnbPu6ENPQaW08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783599328; c=relaxed/simple;
	bh=4DHPjlHLdj6J7HkYDBhZ7UPu72CXJPLetcGH7D6pLbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T8yIMgwsNMOKLmsnPUqr3FyfBpnH33gyJprEOBZgnky8fxSi6Y2SNmuBxlM0/5Ix/oBnvknTrop1olsrAqQC8V1xTZtski1tye2LpgtM2zjqJk56DuXt50pTLMu82HtB+ujl9RLtzqm+ZBJZeZ6ikgxbC0a6BoVo7FU+gFgtgtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fikp+o+E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hxPRlm5+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fikp+o+E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hxPRlm5+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNOEU1537957
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 12:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I1ClfnulykakYWxfiN6hTT4mRoy9cKqDFd/GfOqMO+4=; b=fikp+o+E5petAbo5
	NWi66rI3kl/rkX5CRx5LtCj7NfqIl3ohsKBZq5S2iKkA2wbCJsjS2Je/VEKQcgzE
	rQkSX82JsdsM0ynQT8OpAWCIjs5FUA+XxqTG8a6dDXBfth0AWNBGTIMDuHxO3R8v
	u6U4uW4Pn6KluL0/2vsZzzQL0Yt3sKbOB9ytSEWDrH89eT/OGgMM3l3PyyuCndPj
	VVKFeJOvk9rHMnafLbkqzzQyvRA1Zzt04ztIkrMK4ViWq2wWO3mtdpfZo+FocAV5
	0qxBK61RbX8GYV7n48bBKn6fd39yU72reQERS3aHEPE1e+OaTRyqp1y51aJAErOC
	jBF6jA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa1ydtk17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 12:15:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-385d2703b64so976283a91.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 05:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783599326; x=1784204126; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I1ClfnulykakYWxfiN6hTT4mRoy9cKqDFd/GfOqMO+4=;
        b=hxPRlm5+eir/J+1cPBpo1r71n1axVle7aEzaw4wf/u7b4sidiZQ9406BNsQnXAasph
         opAekLQEElDgwdaaqPEWMRgicj211TQVxql9NTd50kSSjBPR9pnB5WDWprW8EGJ3MBvv
         HL8Hnrx6AExADrOrq2f7blMetb10csVa7cOWFWq3HG2hFqkQr+F1QasOmMbgZFt+0XPI
         LY7SyEry0qwPwZFGiXCoJR6WQRSKthSb00ovt9HWiRJB5O4VSmQYtVnJ+BYJIgGKUSmf
         i2W3W7j0S1x/m5cWZ79xDzAu6/9LnaNTYhzGxNNMwefonCvtq/OZnhKrfI0PSkGV6eZD
         o7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783599326; x=1784204126;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=I1ClfnulykakYWxfiN6hTT4mRoy9cKqDFd/GfOqMO+4=;
        b=JaYXldo41ckz7Sl4vOmlifH76VfZOtAhYmHVf1Qy8j3UHuGq0MUqWgngNaT0vG4qMf
         KTjVa7kOg+1cnvdFLUfV5KLl6f1kZNDBVxnlEoL27k0psLskc9vGdhKUl0B7KXI7sqCT
         /YiyKvhDtzx0Cu/2iAC13YwteCnlfnc+pgl4PbL3r7NANAXI8Dc1W2JrjZmiH+gxPFJp
         k5AHaxenFRtOd+Nujkupcq+kbfDfLOnewC48TCUsefWzHG3k7A62zr8v+0Mq/2ad2WTG
         9jf7g3KqKT8zbfcYrDKsHV/53VShwcH6qeuCx9a5uaDdg4y9JmvkxPHaE6sW1zti7Ws6
         sZHg==
X-Forwarded-Encrypted: i=1; AHgh+RpId52pPFaB9EV1UnYu9uGK775i0MXgULPFyvCsjJJl6ndPH8U/Lp0vDaWSUaMLeDMH1X0hL19RELEw@vger.kernel.org
X-Gm-Message-State: AOJu0YxeoRv4qloI+JY1j2y9qhavR0mRvmnsAEz03zw40jeK4/swnS83
	X2ToHQ9rr8f7iHC/A/Pc/EcNwyq5Hd/HhogFasjA5E2ow8rAfAbVQ0KxBl0N1ti9FIuh7OFu8wC
	2f4Dcai3oCbGRG0qrPUlWKew97i1R29OYJg/JDMUo0jbxFyP97Juzvh2bFrKhkVJdw5pO0ITc
X-Gm-Gg: AfdE7cnK6DWEPvYBvf+HOcpfvBjIlB2auT1ZFYBdYZSzi0HS7mA6bZC1dzQxL4RS83g
	i9UpCMiWJYsjEtag9xi2EgcGkbrBRlw+/f1eBnTMf5gKyzQVTasF6DViqiy6VnWMqCnTrD8zNhj
	evWSu5MxC/Rq/HSNK3yXoG3sjAQLubAxRPGSEavgHSP2ZZm1ntw31/ltlC8e+Y4MjS6GWBpRXkG
	YXWOnDMpFDaYs4K38DHrDEze7l2wiRR9yAyTQQ/XqiCQI9vB3yq2ZE6nXuQ+/5VeWbk3L2e2aW4
	Q5ohrVgVRjefadNyNZlhDirN6qPrpADcwEJ4kV/X6QA2D6sClGyGVxEUZNV2KS+6IVXxnpMJlCp
	QKIUvzs39jbD9ZnF3pLRKczu/7851dDXuWcbKTMAuqMXZeYsi8XPkeucVMos8
X-Received: by 2002:a05:6a20:d81a:b0:3bf:a8fa:a7b1 with SMTP id adf61e73a8af0-3c0d6c6f129mr3431089637.37.1783599326165;
        Thu, 09 Jul 2026 05:15:26 -0700 (PDT)
X-Received: by 2002:a05:6a20:d81a:b0:3bf:a8fa:a7b1 with SMTP id adf61e73a8af0-3c0d6c6f129mr3431058637.37.1783599325730;
        Thu, 09 Jul 2026 05:15:25 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm50551004c88.14.2026.07.09.05.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:15:25 -0700 (PDT)
Date: Thu, 9 Jul 2026 05:15:23 -0700
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: add SoCCP DT node for Glymur
Message-ID: <ak-Q27DbuZAuT69h@hu-anancv-lv.qualcomm.com>
References: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
 <20260707-glymur-soccp-v5-3-053993f0c6fe@oss.qualcomm.com>
 <20260707102536.0055F1F00A3D@smtp.kernel.org>
 <qek6vh2xcc7haiz7w2qdsfpglewxltbpvjedijqnf7bev3iux2@x5cqyojrwjh5>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <qek6vh2xcc7haiz7w2qdsfpglewxltbpvjedijqnf7bev3iux2@x5cqyojrwjh5>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDExOSBTYWx0ZWRfX+p8AWGNSA/Bg
 lsvdzZ2OyYcfaPav56dBJlRTz1imLAp24E8A7RHJkyuZSWFVGCuRWjXGrxPHmgG3XHtnxuL3sOf
 jr5WwjCe8D79R7sXBeH0nnrsOOZnZIQ=
X-Proofpoint-ORIG-GUID: Dn4rzH3XfvE5W4DwlTw0YDsZ_rksDQhK
X-Authority-Analysis: v=2.4 cv=cOLQdFeN c=1 sm=1 tr=0 ts=6a4f90df cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=AaYUaR78CUu4QMINtNYA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: Dn4rzH3XfvE5W4DwlTw0YDsZ_rksDQhK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDExOSBTYWx0ZWRfX9qFX8oEBlzmL
 zZVhtsoAoVoDZWTfw1xbUSHypHrcRSMFgRl07aOaK6p0Nb+JPlB3Xdce+Xr6duMy2mvMJZ35Bvv
 DBjQBgUPX88Ep/uH6UY0HUt/FcmIvY8HYyKlk3J5y/wpm+VcFMKBYoLLaoahs+GPoeEcglFrU9q
 3sxUGY62ZJBKxsaX+PjLjff4mcdlw4KuhWLHzSykwhhCgUbVYeJoeIknm18cHp56mLcs4PLJX2x
 FP5VgnaIdXkQBdOOYXj+bqDZIX5v438nfVKr5YghWb0HBZ/TEGh875BiKYjYOQdoczQ4S52OP6p
 6iKVceNQf6BZM6lqup4iYopMvgYXLl3wPBVz7JpDucyg5kv1Om6IHZvbPv0AX1dCihrfjfHg7yR
 /L99/jwi2+op9PcN859oANC6QZ4v9T/F3SVoUt+Iy1NKTQR0/sB/BvLjAlRsKC1LY4YL0YnNQKs
 k8GU0uxU1FMTRv90i1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090119

On Thu, Jul 09, 2026 at 10:18:03AM +0300, Dmitry Baryshkov wrote:
> On Tue, Jul 07, 2026 at 10:25:35AM +0000, sashiko-bot@kernel.org wrote:
> > 
> 
> > > +			compatible = "qcom,glymur-soccp-pas", "qcom,kaanapali-soccp-pas";
> > 
> > [Severity: High]
> > Is it safe to use "qcom,kaanapali-soccp-pas" as a fallback here?
> 
> It doesn't. Please fix DT bindings.

We assumed breaking the bindings wasn't an option, but given everything can land
in the same cycle, maybe it should be fine. We'll fix this in the next re-spin.

> > 
> > If an older kernel lacking the Glymur-specific match binds to this node via
> > the fallback, it will use the kaanapali_soccp_resource which does not set
> > .needs_tzmem = true.
> > 
> > Since Glymur requires TrustZone memory configuration to prevent faults, the
> > Kaanapali driver cannot safely run Glymur hardware and may cause a fatal
> > SMMU or TrustZone panic during remote processor boot.
> > 
> > > +			reg = <0x0 0x00d00000 0x0 0x200000>;
> > 
> > [ ... ]
> > 
> > -- 
> > Sashiko AI review · https://sashiko.dev/#/patchset/20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com?part=3
> 
> -- 
> With best wishes
> Dmitry

Thanks for the review.

Best,
Ananthu
