Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686893;
	b=iURmEzBVEDAJI1x/c4yBkGJ6fUm/2zHWzkEKnP768/EWXs/+PSYN5j95Cx/2ihrdF55N
	 x6/T6rLMQtBM6qxJIPBfKCn0wKIerpaFvAnfJ8CFKubmpR1Yp26/ovJ8mbKwS8Wh32ZiQ
	 RDoKBCK/HJys+3Rva39C67UudlFYUMwJr9keIrHOL15slcagXluwkUd0BRf1eAsa8iW6L
	 FhioAKfSQAGsB6BFWMJBHE0/gwvKUvMH1DRYoiaAy9xR0i8i57f690khff3NdV9Pyf8x3
	 bbMcgXLXt662rqKS++SZgImeDB8w8aJS1YUf3SBD1rTSrG+LhkV95v+xt5tYubvoIsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686893;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kdx3A01MCHfzKvhg6F0IDQCh+hcLdzZP3RW8GaIG51Y=;
	b=G1gVF4Bp4NMoEK4jOMMuMYbvtvo2WIdWa3TIPgGhHHTVXCrh8DU+T+HFkQX6QN9+ZIGj
	 HiYsNevtijxRK3TZMmSvOE1fh+uWHZwfhMVIaGEBKBpPwm3yX50cnwzrsTPgoVvAtpdq9
	 sV/FjpvAEhEiCl3IJd3oX4qtVGGJwt45tYNcDiAgHJhCWL6EegY9UOT4x7LzePsV2uK/0
	 j4solpkMm0ImRLJAwK5v9hj59lKSwb3nmkzvspjlruWjS8M1L+BBLZTi+YeqHiYQKZz9+
	 UF+fJfDx/mz8n2WNGv9vXPsHqqRDjagEFRlOSeo5+FzCyjWB8A1VdH+5FIRwZ2gL8qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hQFc0EDi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JeAEFP6y;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB10606A326
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CB10606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hQFc0EDi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JeAEFP6y
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B9CW919557
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:54:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kdx3A01MCHfzKvhg6F0IDQCh
	+hcLdzZP3RW8GaIG51Y=; b=hQFc0EDiTPqXE7kwdzQTEPaHnmIXWz979peW16gD
	O0GOiYtjeORCvlpsScpsJkTWRMOJqQWkutpOfsfzli45j6SaydbSQJf9bmxaHBMX
	w6SCkc0Ty9t68lnVBbx27juVGfv4V6xMYGUzVKo5PC8WgFoCAhVTEMCmlK57Jmxj
	b/IR6tF3fto7WruC9oZmpwbU2u/2BLHA7uo11udqhO0YjKRX+5lW2Q9RIRUrT+gk
	4YLaFj6oNh6M5yaCd3HokghKd2UdFt5xjZCtxlCG10RhusyUXsr55VCc8vx4GlkY
	u2Bj8tzOj17i3WWbIOJHfe57ZDitnXRVqiDd1l5iG5Jn2A==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y2h88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:54:52 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b56c696405so9387567c88.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 01:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795686892; x=1796291692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kdx3A01MCHfzKvhg6F0IDQCh+hcLdzZP3RW8GaIG51Y=;
        b=JeAEFP6ylE8rXHTIvD0QRiEWN67zOk9bEHakf6vMrijmjLKWT3wQ+yn1fIiWPlNEqo
         mYhqIixu0MXzvg7wXpstgXLXUPLwKbBzKxU7DcNRinV9esLb2wMLnLpK8okOI35h4WKr
         AhuLO9IukBfzkAyFuipW1cJl36pSfuGfQJrgWB+n3K26Jmeovq9DB2JiU0qNcti7E/MG
         u3wqsQfGbKQMN7b1WR7eCBK2YHm8kRBIyYxT82dEhBUR3CgcrO4j2aV/nl9Ey2tuV5MS
         P8XBfNO15alpxa4cxHIhIVRIOMQDBDsRLmXO3COI6Cowz9M5Q/VA4s1OGvxMMtsBLXGk
         iG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686892; x=1796291692;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kdx3A01MCHfzKvhg6F0IDQCh+hcLdzZP3RW8GaIG51Y=;
        b=L8kTKk8i/KGBbjiCMF99PJG2D269oguepKz+v8o1hj6gBJF2/cwNDwP+bAivl9fIiQ
         AvGy6nUEFZYp71hIP5mXfm4/GAwdeYlliRkEy0exX3rNy7BOVGhi/cHa5TNr6NkDFsXD
         Wr3CItYH/qJhlj1KCp2PyCYL6hvdsk6dMDL/wALHVh/qm4zjE/3kcTQUtQzYXQSygw0T
         1Cp8NC8rL7lKy7Pmi2PFpfoV5xCk1aoyvd1U0YBTwJvKt5av7aslrwfIHur0txEM+A+U
         Z2NmYu7VYjWwfO2bqs9GUYOjg/OmbmPuG5jsKLZHCBU0MthA+FnaU17pT0eCDljJb6Ay
         fKwA==
X-Forwarded-Encrypted: i=1; AL+hErGI0OwuOiZictjrRj7nzobuJ/dkRRbnqqcdii0qHsk82kmLz5nDEJa/eQevAaoung4rIht4SSnDzowV@vger.kernel.org
X-Gm-Message-State: APuU4Z+FD9GOcqJnSlA5T0c5LvctrxxtJMxul0wotFDLGtPozgCKwtz6
	GwaTso7mjr+rc9NhRK4EYm5rLSSwoVbDOGzPDRyNjU8biYhCwVRtbGCJovP0CL/ka+PwCMoc5T9
	fNhf0jYmuvW4Rz+uL8uedIFlXdnkTaqNQSelXioa0IRdf9jLTqeHfx1gsu8WKgMAF
X-Gm-Gg: AZFdTZdF0lMdxocnyYwn8eHEfLxfjMeHEwsIKgKIJKCyTlOWXxYRIk1QqhGoSHDSfqS
	gJjTFDQuPtwPMlF7cNWxDqgvNaDNgpZgX5z2vyKZRPL3KuSDSZRCJAPv/DsFoNRmWkyEL43/3OE
	Z+CzeTtxOmNoOkg1llyKd1BQ09jfd0Bj7RtOo698rxIyAk5TdKxDfFDuwAvIdMgrrTzA2eQBrsH
	jHsLTYzxdnqxZkPuM4DpIdHQiRtM2IUz+Hu5ymvGuX+UfcXA/u8ubq82w3R7/orEIh7ARjcOI/M
	StH0K/6LvT2bxEUqvT+f0Fy4HTpD/qGcvFkGLHDVZx6XLXBjZIEjS9RDX2XqBAhroTmrIyf/4MD
	IjvUI2QyJXjgJ0M1yOEFmp0frdQb3313aj02ObiKBPYqdTpl6apBT7UhjcZeM45ENF1Rj+UZOKo
	JMfISQVL3Jn/E6zmwEmw1y/Cc=
X-Received: by 2002:a05:701a:844d:10b0:1b5:888a:a1ab with SMTP id a92af1059eb24-1b5888aa35bmr5577028c88.15.1795686891992;
        Thu, 26 Nov 2026 01:54:51 -0800 (PST)
X-Received: by 2002:a05:701a:844d:10b0:1b5:888a:a1ab with SMTP id a92af1059eb24-1b5888aa35bmr5577003c88.15.1795686891362;
        Thu, 26 Nov 2026 01:54:51 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm48932950c88.10.2026.11.26.01.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:54:51 -0800 (PST)
Date: Thu, 26 Nov 2026 01:54:49 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
Subject: Re: [PATCH v5 08/11] usb: dwc3: qcom: Restore VBUS override after
 system resume
Message-ID: <awgB6a2rwB1auFpQ@hu-petche-lv.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
 <20261123104727.1539149-9-faisal.hassan@oss.qualcomm.com>
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
In-Reply-To: <20261123104727.1539149-9-faisal.hassan@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX0nJeP5mK520a
 1ZeYccWJU/uMHuqIYx/VqBMpqsK1T6Sg1UJg0Zv3KPJb2yLKpG8I31N3JBNLCxsZBOYCPNJLweF
 LB49K74IcayRj/pmTHOG/wlXss6RGnihTEOHLGVV3ZGy4Tnqgu6bn+lNmIBvCPQTI9fWWQ/Nt1B
 MpvlsEs29IOq95a/7GXSApVP8G6LAY0lr5NRomUXyQfJKj6IGngJs5p37g+sU6tedMnhzxKgESa
 5ci7dx2tQBU11hV3n8ffG5pUxqnYTh/98k1A564lzsoxI4l8Kvwfebr0fcqsUmDILO9tBkyBXwX
 qgbUBh3iX+ZcnXVUFBYlL1OvQGJVWL+P7hyrcKiF4Ff1GdEDIRI/SQEMyei2mmjfJlCQvBiZZgI
 TjTzlStc61iSUch/pybaTHGdkLGpIZsIK4J7YMPt3fg4xsAsMv0xBxYAhCiwNiGIO52LtnQpPHE
 Xsdda+Y3qTGVVPFrU5g==
X-Proofpoint-GUID: XjHkaxfsFAnAbQsLhlxdWp6kPVFjDqgF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfXyXjYYn/qJao7
 tPEcdkV2vz/d0ggv9K/5gjAkW6v3XR42xJ3uXHjwmQgaK9YtTOQn9YF/cQoOwtiXDxFdes/oF3Y
 UbxWIQjipJlqiNYgKC2ZGr7D9gUYPi4=
X-Proofpoint-ORIG-GUID: XjHkaxfsFAnAbQsLhlxdWp6kPVFjDqgF
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b0801ec cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=2q1QCJqqa6WVGGjbUB4A:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038

On 26-11-23 16:17:23, Faisal Hassan wrote:
> The controller reset on system resume returns the Qscratch registers to
> their power-on defaults, which clears the VBUS valid override that was
> set up for device mode. Without it the PHY does not see VBUS and the
> gadget fails to enumerate after resume.
> 
> Re-enable the override after resume when the controller is not in host
> mode.
> 
> Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 8e8d7e59c6d5..50fca06c83d4 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -457,6 +457,14 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
>  				  PWR_EVNT_LPM_IN_L2_MASK | PWR_EVNT_LPM_OUT_L2_MASK);
>  	}
>  
> +	/*
> +	 * The reset above returned Qscratch to its power-on defaults, so
> +	 * restore the VBUS valid override set up for device mode.
> +	 */
> +	if (qcom->power_lost_in_suspend && !PMSG_IS_AUTO(msg) &&
> +	    !dwc3_qcom_is_host(qcom))
> +		dwc3_qcom_vbus_override_enable(qcom, true);
> +
>  	qcom->is_suspended = false;
>  

Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>

-- 

Thanks,
Peter Chen
