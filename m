Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BE53806C6
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 23:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779321413; cv=none; b=ZAmjdcHEwIIav5rOJixNw4LRPD3ZlFbc4R+GXxH/Qkp5T0UQAM3QG/YZ/U9Z0KkUsUHs5jrGxlcbhKWMVEDejwZBbIkGm3DBTi9buqOQ7Fh6MwY6i0cPGnM9pWdxnJ/y4g/bctIg7lvYGYrD9AoNtWZJ/3v2Sh8WOqsg+ygujS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779321413; c=relaxed/simple;
	bh=moc/C/hxlezPQ1M+gC9AJqvzkkTyWztlJQm5e3MVXGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lH/8WNoaLbmd23XSjapi4wQIc/im+VET29viCYk0Lx3l5VvDYDhyuGwZNSWJJPSFhH/SBmq4807yBAQF40K3hVTwx6fdNWmFGmpyVkia2cHO/ucdi01POC4tsHbqhhf5rkg1d0+y37w4bKHzXCQ/mrW6bfLlgiNi9ZC1Az5wbz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EKkppX3r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FwH1dwmz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EKkppX3r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FwH1dwmz"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KFUe0S4115208
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 23:56:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HA94vrokU8Taiu6igumszTTL
	8SiU4GRGCJMCNdjBwRc=; b=EKkppX3rRK069sgIL0n4j9+8QXCnTjcL4GZnYTzj
	YRXhQgnMwep/qQELTkj1u98kzF3jdJqIiMrvekfSYSjxciaosIjJccLFwzDDJahB
	8lO9oAh0SJpzA6PhbGVqd9/z/oT5ipLsavRGysfs5Dsi1LnG5KOWMhbRVRzFYtGO
	Vc3WQ/ijCvEgQN9C06WViEOXaqO09KWMYpR+4WW4dkCpzxIEjPXR48zeIQLIePIx
	piNN6Xo+r6Z8z7wCrjcWmqJSI8YOpmkYl3U9u0sxzPNxeMNgoQChGSDdzX1F7kAN
	NCeOKUJ0dSK07XoO+x19ONqjfERxsD97DEJSzNrBdxvggg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e99w0ka2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 23:56:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50f13da9684so71566721cf.3
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 16:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779321408; x=1779926208; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HA94vrokU8Taiu6igumszTTL8SiU4GRGCJMCNdjBwRc=;
        b=FwH1dwmzaSBjUqlRDe6poZi2y9kp0I/L98RQcm5n5KwG3/EATdpMvbPQ3kK5MICqJp
         ePxg9mEz4N8Pj2NS2TJYUJlAgZG3Mm0pYU3J3dmIvjCHPQ0fBd6C4BAQuikcozfbxJyK
         Le9h9NWvUNS8AYfdqFoyzBwi2p0iFo1TW/dQeODqX3RX/92UTbYhnTBlfaUmeHfdVr/Q
         d6ytlFVZ/gySl90IUvY8ym+dmxnPsCVY3ZsbryJ7j9+wPoRYikNMNf9Xq8OY6EpaJ4oN
         Bml6vB8Q8ru/LNGJyLt6U5XrVVGD9elMDplo/m+vsc3AsN11YFxW5c8t0zFcOqJJbt2q
         EdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779321408; x=1779926208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HA94vrokU8Taiu6igumszTTL8SiU4GRGCJMCNdjBwRc=;
        b=HtKiJcVrfdSBnUXVpcbtet/RtWzxhmSbfGyWKb7Xof643bSKvpSR8+4FnEaZ3gzcVm
         0FGiijeg8CMXnBn+EuaJ9y32m9xXEMNMvmn7qz7tbAMqFgAevWmFUTGuAvE/Y6ut7pgT
         VGx4Wk15vTlhQJzLYYPXvNBHCFlsjM60Bh/frj8O22eWzwTxBA4KV4MC6NgOThuwLQGa
         SMlx76MQh7kQr4yWJV+lM0QHW867bPnQ31Vk3HdM/DTbhhKJuoHXEzogeO9p4hOOjLzz
         wg7e8pqRLb/Mx0y6Yis/MMiQb0EZ1xaDkYFMPjmE0QsOzu+X3YTpSpBoOki3qQHe+omL
         uzjg==
X-Forwarded-Encrypted: i=1; AFNElJ/qttZtxGa9hzWQETFsxaRlZciY842VWAMwJEOfZoJAIYQUWmgV6tlyqw+lB9rLwqgnvvQLureNeunp@vger.kernel.org
X-Gm-Message-State: AOJu0YzTA/08+shFwz0mnbQnCnkbYSezmRox/Cb7VTezyN7D/RiWgGcY
	fYnzrGgKzIdPZPtedp4kI0cbT4nZCDFGOeeQC4FCMi5XrG1n+M6e0S10mP2EaFfEjwmgCxUtXu9
	GGwkpPVwzGqeMGA74hYsGMFpScmh+yVHth0OBwQ+bFc4rzAlv+j9u0FDPSg/cTGFw
X-Gm-Gg: Acq92OEgUCT9c66s9BGBxzVWKvxsYiCY6FHFYwL77/r7YfRM0/9dY+ehpvJ6M2UwL0e
	9IB0wv8rH6UnnDmbfYh0ix0Cjr7wil7eZPjERtpuvfOPndGWJjaZnKAPog4o5uPsu5P8d+3JHU7
	DP0nKhXWGqhcZgPN+G3daq8vg14KGTJAWbKTz8+QWyhXJSOGMWKLT/IVei/8s23dd2iFFMT4+ad
	NxSOyW/KZbVkZzoO6iBZI1bJnpQ/qFFeQbHYsaXsSabycmyFdCtOOePOzHXKy/qyA6lvXi1+qHx
	gJ3FN3Gv/yGIXymsv3p80oytpkp5kj5XMRjvtj9vU/ZEiGp5gZkFHqQx7Lh3+NPTbexlLTLWOET
	bnctEEDkvczzEiFUwhH3wubVbx4jBg8Yp34vA8bvrhrgCWfreZ6iwi4DVvgNMY0e5Esdd6BpaZh
	jqMcjEhsrNQ0zoVRjB6Cs5M25oQXtjlCPA0ck=
X-Received: by 2002:a05:622a:199a:b0:50d:cd5a:577b with SMTP id d75a77b69052e-516c558d6a6mr10277351cf.35.1779321407735;
        Wed, 20 May 2026 16:56:47 -0700 (PDT)
X-Received: by 2002:a05:622a:199a:b0:50d:cd5a:577b with SMTP id d75a77b69052e-516c558d6a6mr10276991cf.35.1779321407260;
        Wed, 20 May 2026 16:56:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164cec52sm5289053e87.72.2026.05.20.16.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 16:56:44 -0700 (PDT)
Date: Thu, 21 May 2026 02:56:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: interconnect: qcom,x1e80100-rpmh: add
 clocks property to enable QoS
Message-ID: <nr62mvz6qrpb6moqyasniqcqtfltsx4qtr3lteeixwutindqri@5joujdvn4r3q>
References: <20260422-x1e80100_qos-v1-0-bcc2afe4cc78@oss.qualcomm.com>
 <20260422-x1e80100_qos-v1-1-bcc2afe4cc78@oss.qualcomm.com>
 <20260423-thick-beneficial-capuchin-e4aaad@quoll>
 <99830e85-5837-4ed5-8f89-fea5d3e632f8@kernel.org>
 <c583a03f-381d-4af9-acb0-ac47a1e35b47@kernel.org>
 <7oador7jxw443astffc6hjuf3gots64fqmvsjdsshfhhonc2l7@2unu723p2orx>
 <12e149c4-60f9-4ffb-b066-7611bdd15786@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12e149c4-60f9-4ffb-b066-7611bdd15786@kernel.org>
X-Proofpoint-ORIG-GUID: sqnGlhDPO649myOcB1I3fQAcg-TMFmS4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDIzNSBTYWx0ZWRfXzt80FSZaUvdZ
 X5wbpbiNmUFKuKiZafnSETtMGZHh6AgJwGk4WLIQLGTT+jHOdRcX0nSllaF1st+lHgo5b5QH225
 KxGxmM01HfusC7FqFk1vo3zoDHKBBiIKRX7cCP6RmA/VwanxSB57wnhBLrCGF5YIQl1oDSOHw8y
 9OCPAQw7r6MbaROB51YMHwesbTWZEIXcxkmb+KcxdXAlVKjTmKplfdKBtyuS5cP6tf+yD+EC2ll
 LCJPvI99hYBD3LlsmDhu+KKLz7u2tJMBhh75xvBXCiu80x4CKmxI6IhzmYttP5qC2WBZgautFAp
 QAKTXISkqLfoWjF5s7UlWxVQbAQJxctA9/iXFXCuf2vbyEmVN6rLe/bsNryBoM3f1FlofaoRyqG
 XR0q3EYFvejv3JQImHS142OobAv0rNAksF7uVuaHWEFdhh23LZYUHDM+lTxQ4JeedkJEx591TBB
 LuITnQIkv/bX32XNk4w==
X-Authority-Analysis: v=2.4 cv=RZigzVtv c=1 sm=1 tr=0 ts=6a0e4a40 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=Qe6B47XUAAAA:8
 a=EUspDBNiAAAA:8 a=4Vwit0Qz_EnXXS5uuC8A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=QWPKR-PWjQKaio0naagv:22
X-Proofpoint-GUID: sqnGlhDPO649myOcB1I3fQAcg-TMFmS4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200235

On Wed, May 20, 2026 at 09:33:52PM +0200, Krzysztof Kozlowski wrote:
> On 20/05/2026 21:27, Dmitry Baryshkov wrote:
> > On Wed, May 20, 2026 at 10:11:47PM +0300, Georgi Djakov wrote:
> >> On 5/20/26 9:51 PM, Krzysztof Kozlowski wrote:
> >>> On 23/04/2026 10:38, Krzysztof Kozlowski wrote:
> >>>> On Wed, Apr 22, 2026 at 02:05:11AM +0000, Raviteja Laggyshetty wrote:
> >>>>> Some interconnect nodes on X1E80100 have QoS registers located inside
> >>>>> a block whose interface is clock-gated. For those nodes, driver
> >>>>> must enable the corresponding clock(s) before accessing the
> >>>>> registers. Add the 'clocks' property so the driver can obtain
> >>>>> and enable the required clock(s).
> >>>>>
> >>>>> Only interconnects that have clock-gated QoS register interface
> >>>>> use this property; it is not applicable to all interconnect nodes.
> >>>>>
> >>>>> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> >>>>> ---
> >>>>>   .../bindings/interconnect/qcom,x1e80100-rpmh.yaml  | 62 ++++++++++++++++++++++
> >>>>>   1 file changed, 62 insertions(+)
> >>>>
> >>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >>>
> >>> And unreviewed as it breaks users:
> >>> https://krzk.eu/#/builders/102/builds/70/steps/23/logs/warnings__3_
> >>>
> >>
> >> I will just drop these patches for now, i have put them in a separate branch anyway.
> > 
> > I think, dropping 'required' clause would be the easiest fix. Or just
> > wait for Bjorn to pick up the DT changes.
> 
> Could be, initially I thought this is actual impact on users, but indeed
> now I recall that driver prints "info" message and continues. So the
> binding is not correct.

I'd say, the binding was not correct: the hardware has the clocks and
the requires them to function completely correctly. I think, the problem
is that we allowed incomplete drivers and incomplete bindings (Without
QoS support).

-- 
With best wishes
Dmitry
