Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA96A3FA5F0
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 09:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778665452; cv=none; b=J8lQK0yHIJoyAjOtcofeIN2oJYzRtNUwhyxrFz7zKKhvvp5zK8APZ9S0WSwPRQTmcuo/PI8JRGZAdJYDNBDlSwSz5zxwlG7y4vnq7CiW8IWJLUyaGOXoRRr5OXtDo60EsoE4yluk8w1yu4hQqbRNi4bwpj/nfLcvPgj2p1k9qro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778665452; c=relaxed/simple;
	bh=PNjiji/ryMz6Wi/3/P9uB7M9klgp5B7XZAWK988RVbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KSUvOIAguy43F9rVhK3uDUKtU5l9hYnhFcKyrv5rDWX6CwWmeCE24OFWCj/AT6BPQ99zqyHAqgo1rj91dIlQmY4swnZ5DXbmiayrucDtC4EFFHHrDb5z3DJFBLBh//aVGFxXi44Xlnm1aYWWleoW5Zk4VhZl2xADBONd0QUTxpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a/Us1Ino; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L3k/8uK0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a/Us1Ino";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L3k/8uK0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4pBjN2652515
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 09:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=l3LZDvSQIk1yYdY+57/8y83u
	kT6k6LZlb+xTzsHJqWY=; b=a/Us1InoiHoDjDzDYKrVJzu24Wrpv0YNKCBl/eYK
	s/Fr8eztDR6QC+CKgdzwoghFRLO6vS0RgW/DZo1yidDOQFtQBuzpt9hFGB1pwfxU
	iUQ4GeHx6oTO+qPF3x/FhrdqwBHvMYBM88orctQd+XxLFY8CFAHY223Pe/NSaQ2b
	Nlv6CDAhoqkujumVqYlnoQhZGCNuqLkARJu3MWyojrGUyPDdBCvU+IPYMycjwizO
	DaI/qYbTX2FBltd89VfpiVNFcbgYTCeiE6+5qFLtggwc7eq9i8UWR5uvQiw1WUya
	inztiyyfhfoAIH8nHwfv4IUtU8EpjxYzsh9lYfnr2fc68A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e45avm308-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 09:44:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fb3403e99so126817321cf.2
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 02:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778665443; x=1779270243; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l3LZDvSQIk1yYdY+57/8y83ukT6k6LZlb+xTzsHJqWY=;
        b=L3k/8uK0bSbZp6xdQu/h6EF3QYiAIxYK8tOwGIcWtwiYTePfYJ/JJm9Uldz5gRUfmw
         SCmwZWSCQjvKwwPqld4YaGwbiczYvTYqiAdlLCy2+FckHUUrsyGG46mX3yy8Esf/iOJY
         bo6HTkDHXVU24XF+fOSaCTaS7vUzyiyoNHTJBO2m5/KOHeYkLj/SyMTKuALYPc3P0ykw
         /IlmoX+yAXBQDpKzv+9kKg5DxaFyLJB3RMHJMHLmmfKAnN2X3zmWJxrujgJTFHkUEf5t
         aKfPqiwqPO4sxHacvGVR4Ng4N7b8RUnB57oVn+KQ3tS2mcY8ecl+4CYKFxn6Y5SVI5UG
         iXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778665443; x=1779270243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l3LZDvSQIk1yYdY+57/8y83ukT6k6LZlb+xTzsHJqWY=;
        b=BhrOFDSeUGfUMVExFhQTqvBd2l7PeLp9oQgnvdjSpdUXD755lj1Rl0QnZJlflewfCg
         vSdcyEXij/hKczVfacFmwAKpeIuxE8bLychraUjx6fEtpeBr6uIpfzp7laEyCRwPUyOi
         GpLQ011mU7zQP2x3o1DKPL9z0+Wyqz+tQdG2GF4z+gPh+lA01cynQQ0UXZV9P3B0xsVY
         XACbbbeyXQlwqIfDmHWkxRMmRaFtV1cDFlq+GN0QUkiiWsm2HYAJndd3tnoo5i2GAGNO
         Vn21NP7gtjaJIaF480GZa3VFPIz6+Im0+nn/4u8oGrz2A3uXXzvFvjq5lPMFJ2vl3loW
         Tc8Q==
X-Forwarded-Encrypted: i=1; AFNElJ9G0ilmTsx8SXvEzL/cRjxsaJCiyFJFc/0pRhWz9UT/stl4uCqRXfZnynIWp9N2L3kRi1kT63PInGOy@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/pM768bpmJei3SmJW79DXmbrVkEDZMD5KBP6I5hZmfe7AaylL
	TBORqXrdwpYTjbM6ir6DahoUyaXIKuPsDmO8GAxEvFWV1VinLwql7L+qOZ2/J7GPmUlzdF92CEh
	gOUKJO38gJOMavagCbYPWkqYRYWg0DOIjFT+sf4EcjDu+gLH/Uauab1OHYAalg4S8
X-Gm-Gg: Acq92OH35N9ty81la2N6wxKQKJP+fXEnd6yPpqnXU+vzyYb9jH1GNM1KjwKWTc5//on
	3G5ZRvFYh2q21HMOJlvhYxAVwKA6oDxDCyB1vqMtvDwKs0cQ9DiYo4oJu8KUBHwJv35Niz2kUsp
	d+oew1cdw0YOlbDTXCW0M3PH0jaSrm7bKtuibaqCZC81bQR88ZauXN4hqDerZt/PuJrMdFwaMTx
	olg3UB+bQrP4ZEJahEw5WFUOVlr5ocrzOU8Fb7upj49oMqb2jc6Qkswk91tpv96MkhfkXFBdD/0
	LWOlya838Gm1xSUcNf0A9fXsNr1h8cWa3r3JOD5fQlC6SCYZLMdES0xg20Rfab12HxRmzOVmpA4
	Y4fVCq0QswIk8/T4OUcrh8VmXgQjXsoyoY68t25tcErp2nfiaUwQ4r7AUWYMKLD1MIcuA1cACc8
	aY5mF8FXsGI+eKv8vB3vzGvDLb+x6AG3GICgU=
X-Received: by 2002:ac8:588e:0:b0:50d:6557:5c8f with SMTP id d75a77b69052e-5162f67335bmr32283521cf.58.1778665443209;
        Wed, 13 May 2026 02:44:03 -0700 (PDT)
X-Received: by 2002:ac8:588e:0:b0:50d:6557:5c8f with SMTP id d75a77b69052e-5162f67335bmr32283201cf.58.1778665442719;
        Wed, 13 May 2026 02:44:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d487sm3902746e87.24.2026.05.13.02.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:44:01 -0700 (PDT)
Date: Wed, 13 May 2026 12:44:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: eliza-mtp: Enable USB and ADSP
 support
Message-ID: <66po5l2k76hrlnyyxx5hvzkz7wng2rwoskrrcuti3cbspmsgwm@ee6ijyw22dg3>
References: <20260512-eliza-adsp-usb-v3-0-6420282841c2@oss.qualcomm.com>
 <20260512-eliza-adsp-usb-v3-3-6420282841c2@oss.qualcomm.com>
 <bi7m474cmmnbdfxd3kzdt4hywm7teu3jo2bzywk4x2tx24lh6b@xhdfnm4e3rfs>
 <7a6tbenqnogpk3pbigds77ogo2zambykt7i7jshjhi36gam2oa@3hrp3icontya>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a6tbenqnogpk3pbigds77ogo2zambykt7i7jshjhi36gam2oa@3hrp3icontya>
X-Proofpoint-GUID: 1r3zlWp_KSKBILYtd1sES57A1P48zf96
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEwMCBTYWx0ZWRfXwFQr9zUESGZ4
 P0syjmOmtZou0HRg+W/nFs1BtHLC4ex3RgtPU3u89gdTxP0MA6Up2KsYrc+Nii5vMnkkODiRZ+A
 zSoVrJahn82WOgQqCWbv44XEM1msefId28dG9ufc29+2YCZ6I3Fui2N4rw4roDCMAq3Ift/rniA
 uN0CgVzUyruubpQwqTwbd6UteaCaVTICaEQSOWySS78pChV5cu8BEkHR8GeQH98KBmi6ha6OZdp
 cebrR0wxmW7cccNvuZF5+vPygJAUxZhWD/a11dPa13SL7wnQpl5c+krJCjZDmrPsCOlOD5ayVqb
 7TfwIVGJ+KOV9YUt9qmpimbOvdWN0sw2nFlpTw35Ha9lQprpxwILlXor6XSSaWK/Vv04aL3D+GV
 EIR5qipFhSbqzJd8r36jSLfBZh5w08AsDCwn9LF1pCe5bm+zVe22KMlcJi1fIdgtZ9pY5lsnita
 t79iynmHl5OxJO1vJSw==
X-Authority-Analysis: v=2.4 cv=bOwm5v+Z c=1 sm=1 tr=0 ts=6a0447e3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=uHCdCOU_0dtJ56D0yRwA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 1r3zlWp_KSKBILYtd1sES57A1P48zf96
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130100

On Wed, May 13, 2026 at 09:10:13AM +0300, Abel Vesa wrote:
> On 26-05-13 01:04:12, Dmitry Baryshkov wrote:
> > On Tue, May 12, 2026 at 03:26:49PM +0300, Abel Vesa wrote:
> > > The Eliza MTP features a single USB Type-C port. Its USB 2.0 lines are
> > > routed through an eUSB2 repeater provided by the PM7750BA PMIC.
> > > 
> > > Describe the port and repeater, and enable the USB controller and PHYs.
> > > 
> > > Also specify the ADSP firmware and enable the remoteproc.
> > > 
> > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > > Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 81 ++++++++++++++++++++++++++++++++++
> > >  1 file changed, 81 insertions(+)
> > > 
> > > +
> > > +		connector@0 {
> > > +			compatible = "usb-c-connector";
> > > +			reg = <0>;
> > > +
> > > +			power-role = "dual";
> > > +			data-role = "dual";
> > > +
> > > +			ports {
> > > +				#address-cells = <1>;
> > > +				#size-cells = <0>;
> > > +
> > > +				port@0 {
> > > +					reg = <0>;
> > > +
> > > +					pmic_glink_hs_in: endpoint {
> > > +						remote-endpoint = <&usb_dwc3_hs>;
> > > +					};
> > > +				};
> > > +
> > > +				port@1 {
> > > +					reg = <1>;
> > > +
> > > +					pmic_glink_ss_in: endpoint {
> > > +						remote-endpoint = <&usb_dp_qmpphy_out>;
> > 
> > No redrivers?
> 
> It will come with the DP support.

Ideally this should have been a part of the commit message.

-- 
With best wishes
Dmitry
