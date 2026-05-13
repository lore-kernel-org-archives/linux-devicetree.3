Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B504C36C9D0
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 10:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778666662; cv=none; b=e/S8XkZqwmYC25Hgt2ZpfKjT++gJtFQdswXaYU/YSRF7n9TLm514ri0gLL+RF63Cj/jNIbTdOwD3pTsto1f30wnG9jXVtUEVRYc9C3u1UnNj6fr00wDlCn8I67Tlat/oknA+RQypI0sXjiPNuWxNyI7zQp3rKl9MGyRjHNiXwRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778666662; c=relaxed/simple;
	bh=988JccY5DXVph08N84rMxWo+DWYg41evQk4Fv+SQsME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A7Q++fgtGfPks7tphlDmpJIqVuK0azwyLGKSTDV9lFGAw5ikkHqzOYz7o/13hdxUBLEPq4yWjAg7VpnJZ7rFEAOQtiVQrQd6EdLMctkBI4WWt4kxbaLLpVfRx7+5budUV2SHSnGvR6ozosUaCwZW4EBoxatNMjN+7v54mlvJhXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RMVLVd3Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KPfel4Uw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RMVLVd3Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KPfel4Uw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4p9LG2652377
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 10:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lOyW6IxsQaLaEmJcJuUH5HBn
	GHV0T27RV5rr9kaXbWA=; b=RMVLVd3Y1wRZTpgNelStmtNwyKLsPO4DMiVa8/N1
	pq3QVJwxH++fFInwpoWmWdkj75520yimqGbRE6MNzzN2HoObMoqmqcMl1afzWSgQ
	nduvPQ74fs2Pn1xWWvO6B8q2d57+cNdgCBuaZi3EJ6yIaaPTjrzD9XeCW6XJgh/Z
	beH+DWrJjttEVYft6gCJZ921J4PWj9iaXRMvNbU+J4MyIZaaO3jE3tse6Y+D3JcU
	ipIHwiLHvtfD+y4O+W7DaR/BMiVr+zz7iArmaHZfrkXCSrMkqgZ54wS4Piuh259I
	bQv9lB8wTmX9LkkS67U5F4kpRJuMvSetNzjo3nH3zG1u5A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e45avm5pa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 10:04:19 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-63136c0b6fbso7436865137.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 03:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778666658; x=1779271458; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lOyW6IxsQaLaEmJcJuUH5HBnGHV0T27RV5rr9kaXbWA=;
        b=KPfel4UwwR2bPIoPjtE9ET7DMXsSeIR5TbxxUA6Xuls8e/jf4kPSBHnpSuClzaGvT5
         U4ydXhaJ/E46RK9V6djwumZ1TFKJ9GYAXyFO3XVMb958rE0LX2FP6UnOjGLtJfOKjcDx
         N/MRRtOkYKMTT12NJsquTmXnxUKFvJWQDuIwApUfOdSVEX+xhbasjl7rLM8HLne0D4Vt
         A3XHQdDJfCVhEFGOsy1XSnszQUtwSbrXTpVv1q2sDn8ZxyfUKW5yYW7IaG5R9NkQXvbL
         hSvOLwcWfhkrj3SkzSqLbUjySTP+Dzv2rsU65ECKKkgoP+MFLNgXWQiLib6CCURclwF7
         Jm2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778666658; x=1779271458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lOyW6IxsQaLaEmJcJuUH5HBnGHV0T27RV5rr9kaXbWA=;
        b=qGZtHigzcmzPH1In89zXUxZG9afTKruytbiDfN9IDgClsHm9AGviH9VGTYsvFbTb5W
         K4HozCsfBZb3+uujQ71c1rsKsSUDtlrf7F6jzDX9pKCZOnyk2qwGBB1feKzNRmA1kFzL
         Ly+ay/2jSKivpQQKdZcwoii8gmcjIHrbvrIeqV/82f+j0JuJm2JxuFTMzn9WyEYqGPLU
         HyRqz1qeZqUhBTEkhW7BnMl5AeY+xrHsj7MCan4MLLti73sWppu2AtakSYXFJWf2WQXc
         YmxASAPlNLMQN+wV2m4w9TsBqMwDjosC4vVli+JslDLEYEV7UnhK6xJCzz836x2NblQ7
         msqQ==
X-Forwarded-Encrypted: i=1; AFNElJ/CyBxdBlJ7XdaRl5Npas1xUxxxpjoJ9Wn+Vh5GuiF3DxyS5r2wFZspApKBIbKNbmiZYBSgqyL32ZC5@vger.kernel.org
X-Gm-Message-State: AOJu0YxqKjhEx/HBBUv2B7jc12VBBcfBLkNGOpap2vCO9fDNl7gLYlKn
	juuSG3yUf0vH4u2wR4uh71Bsfgx7vEOPnQ7umKJ/uMmehwKHyS1vAriXuUmSS6fjCg3SCwLehiq
	XYPJ2btD6r8dQqKKTSPfRWO199G9oNcYqMabZmmhAIqJrJx69vcG2ew26eI3K1WSp6AQ2ygh3
X-Gm-Gg: Acq92OGLJCJuU8WCkRNiwy2WUnV6Du9XKU9MWbBSx/Rt6xSXH8sc2Sur8LW/C3NEFcm
	523lDwHBwK6DFMQTKI7k65LNYCr295usURnwTp1dd//mIwZTKJeAxahU7aQK7UizDVhNAAAt3rO
	E85UV15fR9/rYgeQGxvmwEYaj5c8P9WWeuKmRrtPAS8QmDaisEQSJmZ5ued0VliorE6qR0WzwNZ
	A7KtOstnjihcj/+53jX5V1+mTV5uuq35YBzrORD96gkBlKmI67tL2R7vNSkzZvpFR3WPnW1yg9N
	mG1Xu63/V1uUGU89qENrZrJD6/sgQRRucSC/pY9tTiJhkw13PxL5xDXQcmzT3f9uPi8ylccropz
	7SvudGUxj4IVwcL3xrlUKSTfvft7J7k8xRHs2f4qNnM8lrFfac/jyFIXRfo0xBV+oPEoc9Uorfj
	oGFup77bqHEw4iHTnkTotde7NxqaRofKqN5DI=
X-Received: by 2002:a05:6102:c54:b0:628:95d9:9607 with SMTP id ada2fe7eead31-635ced58b00mr3291557137.2.1778666658501;
        Wed, 13 May 2026 03:04:18 -0700 (PDT)
X-Received: by 2002:a05:6102:c54:b0:628:95d9:9607 with SMTP id ada2fe7eead31-635ced58b00mr3291544137.2.1778666658114;
        Wed, 13 May 2026 03:04:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d32dsm3903903e87.30.2026.05.13.03.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:04:16 -0700 (PDT)
Date: Wed, 13 May 2026 13:04:14 +0300
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
Message-ID: <ot3otriuc7ntjsuqbcxwgj4wj5tzcmirkgao3rbrz2flmjmbvf@vsyqdwpfnnxo>
References: <20260512-eliza-adsp-usb-v3-0-6420282841c2@oss.qualcomm.com>
 <20260512-eliza-adsp-usb-v3-3-6420282841c2@oss.qualcomm.com>
 <bi7m474cmmnbdfxd3kzdt4hywm7teu3jo2bzywk4x2tx24lh6b@xhdfnm4e3rfs>
 <7a6tbenqnogpk3pbigds77ogo2zambykt7i7jshjhi36gam2oa@3hrp3icontya>
 <66po5l2k76hrlnyyxx5hvzkz7wng2rwoskrrcuti3cbspmsgwm@ee6ijyw22dg3>
 <inf6cqpumbmo5eq4jejsfhbsqgpimi3mjzxwxk4bn6cvlwgjfn@d5judcn2clxe>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <inf6cqpumbmo5eq4jejsfhbsqgpimi3mjzxwxk4bn6cvlwgjfn@d5judcn2clxe>
X-Proofpoint-GUID: hsRsXVFi-eDs4uoqRK_qYgXXriGQaU3Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEwMyBTYWx0ZWRfX6giTIHdayrs3
 TDCEbvLHMR7uW3edH+NUZ0oY59VP0Cd3A58zPKNKZDSmsVEV7nmJVLkjY0awYzxqR9MMnCJTq/A
 hIRBymhp8KEvNyDx7fwMVYedWk2c+g2kbL21pGE+PIdYxbktBKRBXTfrmxOvQxiova/9+iMLPhr
 Rc2vKMHXXgbK4RaXpwMCqndhFkj2i7AXgRqExdWeH6axLsQUN/6CU020w4GEml3kj6L4PDdzQrZ
 zGUA9klvtkm7Tg1ZYhyyDTvElEEMWo5ghruSaStQdxaV5xuVbwXQtOKb9RhDtJvn9f3dupcIuN2
 d3fsOm/wAGLOMDmMKALR62y4QsMX9rRs6JBQoHgKKSMVy+trfJAyFr/DL3CSj8dY7FEZYr0YO6d
 ilcbdJ1QvlSpNDSwgCN2KnH+TQbhp00dzE80t0lhOQ2TrMCM1Q+MugN3F3lTHIXxsLAFgFRn3SY
 8trbQ8JTud5JhidLyrQ==
X-Authority-Analysis: v=2.4 cv=bOwm5v+Z c=1 sm=1 tr=0 ts=6a044ca3 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=WgiHbWNedv94GWvrKy8A:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: hsRsXVFi-eDs4uoqRK_qYgXXriGQaU3Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130103

On Wed, May 13, 2026 at 12:58:05PM +0300, Abel Vesa wrote:
> On 26-05-13 12:44:00, Dmitry Baryshkov wrote:
> > On Wed, May 13, 2026 at 09:10:13AM +0300, Abel Vesa wrote:
> > > On 26-05-13 01:04:12, Dmitry Baryshkov wrote:
> > > > On Tue, May 12, 2026 at 03:26:49PM +0300, Abel Vesa wrote:
> > > > > The Eliza MTP features a single USB Type-C port. Its USB 2.0 lines are
> > > > > routed through an eUSB2 repeater provided by the PM7750BA PMIC.
> > > > > 
> > > > > Describe the port and repeater, and enable the USB controller and PHYs.
> > > > > 
> > > > > Also specify the ADSP firmware and enable the remoteproc.
> > > > > 
> > > > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > > > > Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > > > > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 81 ++++++++++++++++++++++++++++++++++
> > > > >  1 file changed, 81 insertions(+)
> > > > > 
> > > > > +
> > > > > +		connector@0 {
> > > > > +			compatible = "usb-c-connector";
> > > > > +			reg = <0>;
> > > > > +
> > > > > +			power-role = "dual";
> > > > > +			data-role = "dual";
> > > > > +
> > > > > +			ports {
> > > > > +				#address-cells = <1>;
> > > > > +				#size-cells = <0>;
> > > > > +
> > > > > +				port@0 {
> > > > > +					reg = <0>;
> > > > > +
> > > > > +					pmic_glink_hs_in: endpoint {
> > > > > +						remote-endpoint = <&usb_dwc3_hs>;
> > > > > +					};
> > > > > +				};
> > > > > +
> > > > > +				port@1 {
> > > > > +					reg = <1>;
> > > > > +
> > > > > +					pmic_glink_ss_in: endpoint {
> > > > > +						remote-endpoint = <&usb_dp_qmpphy_out>;
> > > > 
> > > > No redrivers?
> > > 
> > > It will come with the DP support.
> > 
> > Ideally this should have been a part of the commit message.
> 
> Why mention something that is part of a different support ?

Repeaters are a part of the USB chain as they also affect USB signals.

> In fact, there is no repeater, there is only an SBU MUX.
> 
> Which will only be brought in along with DP audio, IIUC.

Great, then there is no need to mention anything.


-- 
With best wishes
Dmitry
