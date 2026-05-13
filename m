Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE613D88F2
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 09:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778666291; cv=none; b=paNN2DM2bzNcnOyHee7dPBt2Wfai76VaQIdEvmhoFoImUCf9Zw4qa+LbI37syCNcRLxRrU/vtGKucUFdjhTiP6Hja4BTJa2JwVBj9Xk7CkOZ11pyY6qWYbMao6HsWZyfu7B6l2JoMMOEhCCpBWQGhZja3JcxX13fLAoi27KCTRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778666291; c=relaxed/simple;
	bh=0DvzL/lRO3EBh+6Qf/qJqs218/X7TDeuT82d1TDEtaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r+hEbQk+h8DKm+3J66SJSxjQ2cEzx1DTmCn04uSkW0+QBcbgKMY3htWJlyS70EyTeK0oB3AvwTaZm+Wzvy09FPS9GVsaolXuhyucqOSjfWCu8oQ/p2muu/FM+pgMJuFlWTl13LOrB2uQN7mEstK7XdLRFLWxr6J41QJ1OSDgaig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TeM4vG7o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SmvRzpwJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TeM4vG7o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SmvRzpwJ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D9k05j3008285
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 09:58:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6xPAQBS3NXy8Dk92Q34QE/E3
	JGZz519NdmjNgW67tP8=; b=TeM4vG7out4fGDN0REjQ2ENcuFQynG9I6Wg+DfS9
	4WK/8ScUKV418awh3iDIzHWZYyQBlH6MZlkpqqbINTEvlqklfsEK75cKVfaDtb0u
	CZjpTa8whutsrQK3HYU4AOgdGMgJ2OqvejIKGuU23rwczOiulUm8fmA631Y5Gtrx
	weM+FMM2wB4Zg7qUE2byKdMLC0PT7D8hFY+3igTQSZ/wUHETLDq5l4kLdbo3+ac9
	9I3UtBRfP5ud4bQOvQyZMAMAKeYiDr0Ssovm3VOgGGpxiLaBuyL8RPw4nw/VQ3XZ
	MhpVgyMtcIAydeOOyahxtxkOf2yQKfSp8z2AfGlLQLKRoQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0g1ng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 09:58:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-514ae0e3ad6so94802741cf.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 02:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778666289; x=1779271089; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6xPAQBS3NXy8Dk92Q34QE/E3JGZz519NdmjNgW67tP8=;
        b=SmvRzpwJE1tWrqrc5PQfpW/ROMjGmZqTT0OzTjCXWrxcp68wyzO3uxfV3/NplaAEW7
         +qu7jf0ie++P7tJGAySvTk+Npth+cjY4jMneo9uVGElZbCPNpdyScGKpF9keh8756vZv
         FU+BAs7p1a3TgAkEIa9R6bP40K220qlg3beDjrXKKgInZxx1jcXH7XHQIp77aWk9Uo3L
         bXd7Tl6g164l9XaaQv4fxg0OJoBt3j+cAfeKKuWLTlKZwgPyzTg/17ZKX9NQQ35s5Zvn
         9xk1ZuWAayUjwlVTzwcRXdwGLzWwRlLbqkBRFkZf6DOOxTcmSYE/75Im05O8gGqU1x9S
         zAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778666289; x=1779271089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6xPAQBS3NXy8Dk92Q34QE/E3JGZz519NdmjNgW67tP8=;
        b=L0hR/CU12014y8Bcr8WghWBBpIV1eLLoSdAMS83vx/IatHZt9xsX3rjuinJCrktX1+
         Q5py1CEvoRpfW7uX2e6fqElduPFNU6CGxoVZGJEPP7LgbsSUeMLIcX5RNCFNxHSftdj8
         mZinAz2QEj8tr0tCQZFcsuFcRRarMgzcNT725b8fe+Rm4ecEVUylQv0y8mPEpKMA4Ung
         BjZ/nPhsor1uS43tgU0YHBfdL4PkvQPmQRZVDcrAy1n9lw1roSf/HbS600oRZ/CyjcpJ
         rVy/CxTrr7oU/Jvr9L1FZV03tz90HkUErBbgd4D1tz6nqR8oEKWbhw6khlTdG9wwEjpl
         vjFw==
X-Forwarded-Encrypted: i=1; AFNElJ+gIiL0ex0E/lxvjBJGLxj4RNnrtUQn6fiWHEvSgo8r9wbM3umaV7BLBUv1nOjzSsxbRzHzUZpA7tTi@vger.kernel.org
X-Gm-Message-State: AOJu0YyOY2FogpJKKKSOvuMKdw0Ozry4YMuwmnSMfScgLebgiyjz1SN2
	NTgtw6Mrcpn8Yl4aWwqK4YLLMlm2ibpnRSTL+J4ACZbjjUX0bw7jBxrOhsN+4AFkqJpjavBdW+q
	LzZfYxhLHlgEsf4pxTkmgyYo7SX+wWAxRhyXB8GmsKzLQ25m4GI/0oGh0CJlyTBPb
X-Gm-Gg: Acq92OGIj8SmfYzqzSHQXlWIDG356g7Ka6F42f4iTxeyesEJSCD5JBoWNsTFhqBha0q
	zPrhGAsYWuESlXFTlbMhLp6GlRKzeT8R+OQMNHinq0350wyFtls6RtMnOA/iCY6k8UwajoKdXr7
	2WvbpPRuPHLnhpEx0LIszYAofZyVNJpn1RI4BcJtWh0KSl+E7y538LR4lWT+DEofsEIB4Rfcn9v
	QZ3LLsvnfJZKxfDqrGZSJgib/mA2nPqu4L0D+21bpfwK04eId/7YqR9jTgsJvFJfrrBIbkapC8N
	K/jZRHaZ4/8qHIYFkoypYJGKRw6obLMWNOEW3XBUTikeoY6PklnzJd+fGLvdmU7NOB33vscCuFB
	wpxlG4Eh165vNUGWCuEsi/Lvd3ruGg8jAvtYc
X-Received: by 2002:a05:622a:1196:b0:509:1b5c:fe25 with SMTP id d75a77b69052e-514cefd2ae5mr89182081cf.23.1778666288815;
        Wed, 13 May 2026 02:58:08 -0700 (PDT)
X-Received: by 2002:a05:622a:1196:b0:509:1b5c:fe25 with SMTP id d75a77b69052e-514cefd2ae5mr89181891cf.23.1778666288318;
        Wed, 13 May 2026 02:58:08 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491da03a7sm39993667f8f.33.2026.05.13.02.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:58:07 -0700 (PDT)
Date: Wed, 13 May 2026 12:58:05 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: eliza-mtp: Enable USB and ADSP
 support
Message-ID: <inf6cqpumbmo5eq4jejsfhbsqgpimi3mjzxwxk4bn6cvlwgjfn@d5judcn2clxe>
References: <20260512-eliza-adsp-usb-v3-0-6420282841c2@oss.qualcomm.com>
 <20260512-eliza-adsp-usb-v3-3-6420282841c2@oss.qualcomm.com>
 <bi7m474cmmnbdfxd3kzdt4hywm7teu3jo2bzywk4x2tx24lh6b@xhdfnm4e3rfs>
 <7a6tbenqnogpk3pbigds77ogo2zambykt7i7jshjhi36gam2oa@3hrp3icontya>
 <66po5l2k76hrlnyyxx5hvzkz7wng2rwoskrrcuti3cbspmsgwm@ee6ijyw22dg3>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66po5l2k76hrlnyyxx5hvzkz7wng2rwoskrrcuti3cbspmsgwm@ee6ijyw22dg3>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEwMyBTYWx0ZWRfX8zoM5hTVeNn/
 CDeVxplDNKymH7soqV4H2DJWYD0G7SGL9FxgDpXwKd1MMIihpkQtQMAiZUxFvHOhZvfjtZJ/tRa
 Pd29w6tg0c0zWZ96LbKrIqt+Bu2ffIlRk4eMqy3w+d0/nkBo7O+q9RgRfkaMcpS8j7Zy98928CA
 S0nXD6mUCTZzyuifiB4SIE90kcHYwpW1kooNu/tTwzQoBPmJ/gndJkqskuNdPlwleqHMQMCkioJ
 uZWfs+/z9OcbqhZySm/LaulYQsLBatCvMkhHAXGmRgLT3/ybNkT0jGvQIv3kQ7WOMSKMGDXRtUn
 W5RO55KFGcethPaE0WT1pQWAqz5YDlmyogPotmOBVI2YkOshRRnQO8vDUqkW65yLoBzNxf7zpAs
 PWF53+JMP31yDaP+cB8Loc6CSK2QOsYBu7rFxcQPFBM00NElk+t5nVcuwnuPLZQnnD8TfkJmhhE
 BHeWSl/qs4dJxigBM+A==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a044b31 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VxWbDYV3Dua1dd-2t00A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: KbzveeoFl3L8wSnyjp6Yq5_FshqGjo1Z
X-Proofpoint-GUID: KbzveeoFl3L8wSnyjp6Yq5_FshqGjo1Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130103

On 26-05-13 12:44:00, Dmitry Baryshkov wrote:
> On Wed, May 13, 2026 at 09:10:13AM +0300, Abel Vesa wrote:
> > On 26-05-13 01:04:12, Dmitry Baryshkov wrote:
> > > On Tue, May 12, 2026 at 03:26:49PM +0300, Abel Vesa wrote:
> > > > The Eliza MTP features a single USB Type-C port. Its USB 2.0 lines are
> > > > routed through an eUSB2 repeater provided by the PM7750BA PMIC.
> > > > 
> > > > Describe the port and repeater, and enable the USB controller and PHYs.
> > > > 
> > > > Also specify the ADSP firmware and enable the remoteproc.
> > > > 
> > > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > > > Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > > > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 81 ++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 81 insertions(+)
> > > > 
> > > > +
> > > > +		connector@0 {
> > > > +			compatible = "usb-c-connector";
> > > > +			reg = <0>;
> > > > +
> > > > +			power-role = "dual";
> > > > +			data-role = "dual";
> > > > +
> > > > +			ports {
> > > > +				#address-cells = <1>;
> > > > +				#size-cells = <0>;
> > > > +
> > > > +				port@0 {
> > > > +					reg = <0>;
> > > > +
> > > > +					pmic_glink_hs_in: endpoint {
> > > > +						remote-endpoint = <&usb_dwc3_hs>;
> > > > +					};
> > > > +				};
> > > > +
> > > > +				port@1 {
> > > > +					reg = <1>;
> > > > +
> > > > +					pmic_glink_ss_in: endpoint {
> > > > +						remote-endpoint = <&usb_dp_qmpphy_out>;
> > > 
> > > No redrivers?
> > 
> > It will come with the DP support.
> 
> Ideally this should have been a part of the commit message.

Why mention something that is part of a different support ?

In fact, there is no repeater, there is only an SBU MUX.

Which will only be brought in along with DP audio, IIUC.
