Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF98340DAB
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 19:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779305277; cv=none; b=p0937gGxaUHQTy+JLhi2CNrnkRdKUKwiKLH8rP0UbrGxEFH+RZVFZ+7oi3wSpEeYaFE3ffxxKklZ8r5pZ4YgYxbTuwXjtWDn4ZLOHnVdH8q/rG1enIHok0/LMcxpjrbUx5POBRfSFcipDQWyn3L+XKJaLBobIdVYVUEexMMrLHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779305277; c=relaxed/simple;
	bh=yt8U84SiDNiOBcj3+VaG0c0qI29ReIVNRDRbFKUrqeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rsgZt3czeq2SfI+SOr7gfok99atGsJqlD3C9LYZd465Mryy6h08foi5r0Zm20foXKxXA5c69mjtZUruD2IMBtstXLtSFF9c4tVOVcr3c56C8QiJ0dE3WzR4Yj+ZLE1J6OftAHvq67SFzWodXSqxv5PMRZ92UuM4c5KfGO7alnhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EShGzp/p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K2tZlfo5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EShGzp/p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K2tZlfo5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KF8HEr748558
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 19:27:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Cof4BFpLE8vZCh1gO98ccWcI
	wNC66MDdBlVTZ4MDiEA=; b=EShGzp/piJbn2vB2HmeCAIC1oZaEe0Ci7oZxhdl4
	SmFFJo6uDuGCpWhTJfCssLC54nTBO7yo8LHU6ss8GfTbeHZd/quCgo8TX+fSGbXk
	ImdT1yjKVdfi6T6+AwngTd4twe5Sk0j64yY/Ex2iUWsiVOJPE92e0mIrQYLCiXD2
	2BlqrxeSpkigYdNkfF/dyThRbu8R96ZjmhBsF/HULl87qNmw6jktX/eBLZA4PHqM
	6Xlgm9ESGLCqWvxfcll7hmIseSVQOAee1hFmcPCe4LKAvQQapEIJYzNT23HixFxI
	Ayl/vCHd1McTYlqhKpn4WPIOSPAyx6mBq0CE2pY+rMTnNg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9fb6h2yc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 19:27:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50ea1a7a5d0so152403531cf.3
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779305275; x=1779910075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cof4BFpLE8vZCh1gO98ccWcIwNC66MDdBlVTZ4MDiEA=;
        b=K2tZlfo5hUm5HLcfYaBQRlcMbdvQqmFrKRhk3BM4NYCuMJ0qfVNtZbWBf1k93CUhn8
         ejaHQ+yqHRrA08x+MjzexXf4DJb57CvnfphuytFrbFD6SX4eZPCmCZnniPDYAyPUjK75
         3Zw3XHh5q5/VuVPDP87qaqxBEltn0F0kZKlhl6TThx+Fo8/C2IjytrvpB23Y0kvpZ/qh
         F3ayiZaVXDdHsLG/o9QJFGweHuahWovUM4qEj1dbWn24F8GMQngNXLO9BkMLhAvYRir7
         6Bdr6dbSeD3rD56uKPwPiFNAdmPF0QvJaO8GT1+xX1J0vwuHvUSxSuKBnB/oqZLJkAmC
         UbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779305275; x=1779910075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cof4BFpLE8vZCh1gO98ccWcIwNC66MDdBlVTZ4MDiEA=;
        b=abmCo41Rmn8oMw2TDsh8nPtjOi7haHpbrp9mIGTTpQq3OeSA7H3SBLKk/nBFKsGWiG
         YEivkkMYd97RKGqIVgiiTEdWjZQ3xBe8eb9c3VbG5cGDFSn6h446CehB7MokqywQEA6x
         vxW8sVCUDS8POye+RWHH57822r53/MzmyQ7wcTql01ZKqOG1Jx0iefjBcGI16u8g4L/G
         IVxdu4xr6xKiy1vompuViosC1YQQxkxCcxnf+blhoIiknsbmiMUIIH8jsOOkW5Lc33yA
         Lpm6z3hyS97oBWxsNBErBLVQS0w5oVG+VlGW000a7C9mt3JQM04AcAA5VxnuMng6WvzT
         aCog==
X-Forwarded-Encrypted: i=1; AFNElJ8QgGo8PSl8j1EnlhegjQgHyKvbDtEvp2M3FD7T6Y2MSH9IPRzyxwmDwedNYehJlYVkpdSd7AFSJWWr@vger.kernel.org
X-Gm-Message-State: AOJu0Yw34iXzJTYThoY2SdDI9h9sb8V7ihydQcYRJiZ2PiBlY7X2r1DB
	2/GDm9TIa5Vbv+e3ouMf2Mt1iCXhXjCIZLtKU1urTpoZxV9pdhmYrn5ukqpiZxnN6bPBtlZWLgb
	bj/LYQYQsdBX9LbA7uo8/KXgHG67NqvjTD97IL+hZaovJrMVldw1ighsiNGvVGQQv
X-Gm-Gg: Acq92OG7fol/CVrWMgqd1AjtW49HJ2Bhc1YQfmf5YL03CwILEuR7IEqUJkY7DjJx2/T
	eQaIox4nDnf+akpKJut7Q3Oad+Eznz0T60g0Ysbx9yzo8AuShK+OyO41JGmE5deQ9SrYvxgN9qy
	lvB1zIvXo5butd4uWS43/tw1uej01deeNuMbvQFHnk7k97aMomXYZnNIhuPRT2D1LbLsK9NNxwz
	ZRVXgUtuSMqDQbjNjVPy+6qbngd99XSzeQ91YkspKtYIOSfzFiXmWLkPyVszLlCG38vlW19ZNXG
	7QCMQhLn5zQnVxApUTU1WaLelMOJSc24FVcy+dMjCHxSryKD1Lcjy8c9B+QFLCaOZZYw5zxYQ0W
	6mJWjRU/9OzTRu/iwjNCnH47V0UIBcBb75+3rizgPRRLTILsFblpmMROv2JpB/q6zUYW+wJMJlm
	Pt9ucFyCArEEeaQRJt3Y9/D6IBnnWDTX/I/cA=
X-Received: by 2002:a05:622a:3d0:b0:50b:4e60:93b7 with SMTP id d75a77b69052e-5165a20d00cmr344523831cf.43.1779305274498;
        Wed, 20 May 2026 12:27:54 -0700 (PDT)
X-Received: by 2002:a05:622a:3d0:b0:50b:4e60:93b7 with SMTP id d75a77b69052e-5165a20d00cmr344523161cf.43.1779305273869;
        Wed, 20 May 2026 12:27:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395882c74d6sm31850691fa.15.2026.05.20.12.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 12:27:51 -0700 (PDT)
Date: Wed, 20 May 2026 22:27:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
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
Message-ID: <7oador7jxw443astffc6hjuf3gots64fqmvsjdsshfhhonc2l7@2unu723p2orx>
References: <20260422-x1e80100_qos-v1-0-bcc2afe4cc78@oss.qualcomm.com>
 <20260422-x1e80100_qos-v1-1-bcc2afe4cc78@oss.qualcomm.com>
 <20260423-thick-beneficial-capuchin-e4aaad@quoll>
 <99830e85-5837-4ed5-8f89-fea5d3e632f8@kernel.org>
 <c583a03f-381d-4af9-acb0-ac47a1e35b47@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c583a03f-381d-4af9-acb0-ac47a1e35b47@kernel.org>
X-Authority-Analysis: v=2.4 cv=do/rzVg4 c=1 sm=1 tr=0 ts=6a0e0b3b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=Qe6B47XUAAAA:8
 a=EUspDBNiAAAA:8 a=mpWlrPG02yKYcU8NnnEA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=QWPKR-PWjQKaio0naagv:22
X-Proofpoint-ORIG-GUID: I4Pu9-RbVMOoEQqjAknnWWGZPt6or_TI
X-Proofpoint-GUID: I4Pu9-RbVMOoEQqjAknnWWGZPt6or_TI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE5MCBTYWx0ZWRfX7iy1Tw2VD0lv
 26PrRA3Wt2nKTD6cZ08cJbKAA23X9G4nv4XtOmta9+ji4bODtmehNIlwGGHmN8E8HZROslw2LAd
 IdNNViNMoTrEMCkOYXu1u+GjxpVHz1FglOtWgGP6eBlXCS2zSuCMYw26i5VB45j31eWQH1Nu2p8
 sYO0SjRX5jToEz41ICQyILTJpigaj6zKIYALTor7amWkg7bjcIj3zFdTMux+92GkgWaXDEY6hZZ
 b6KGsCt7/A2VWCuIWQiINw60arZRnSqQTUioaxOxx2K94dmGVhNpBgyv3ubR+aIRyXYYGNMw6df
 JZmBysAWPcPWnTZ3bGFzAplHrWmKT5bhAfBU+rUlqcwjImxM6ZSqpYCyQmw9psq8agSh6b7bdcI
 8q8JNYFl1gTvATLUXRHD/uNRrqDeCdZL+bWlaWxgsJ/rT39IgxYV7T0gu6tXYd78eO+unp5y5gs
 Dgma/V4ziD2yGMbSzsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200190

On Wed, May 20, 2026 at 10:11:47PM +0300, Georgi Djakov wrote:
> On 5/20/26 9:51 PM, Krzysztof Kozlowski wrote:
> > On 23/04/2026 10:38, Krzysztof Kozlowski wrote:
> > > On Wed, Apr 22, 2026 at 02:05:11AM +0000, Raviteja Laggyshetty wrote:
> > > > Some interconnect nodes on X1E80100 have QoS registers located inside
> > > > a block whose interface is clock-gated. For those nodes, driver
> > > > must enable the corresponding clock(s) before accessing the
> > > > registers. Add the 'clocks' property so the driver can obtain
> > > > and enable the required clock(s).
> > > > 
> > > > Only interconnects that have clock-gated QoS register interface
> > > > use this property; it is not applicable to all interconnect nodes.
> > > > 
> > > > Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> > > > ---
> > > >   .../bindings/interconnect/qcom,x1e80100-rpmh.yaml  | 62 ++++++++++++++++++++++
> > > >   1 file changed, 62 insertions(+)
> > > 
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > 
> > And unreviewed as it breaks users:
> > https://krzk.eu/#/builders/102/builds/70/steps/23/logs/warnings__3_
> > 
> 
> I will just drop these patches for now, i have put them in a separate branch anyway.

I think, dropping 'required' clause would be the easiest fix. Or just
wait for Bjorn to pick up the DT changes.

-- 
With best wishes
Dmitry
