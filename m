Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8F63E5EF5
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371488; cv=none; b=qellU0jWB4XTMdBQMJ+nOqF0xqPH12KfMwZHW2IcHDrkkXaEG+k/JQYd4XJhGfB6uzkfhtKOGTkDJ3F4UTBWkuO6vePxFCMFNrgf+hQqc0ktAWT0jgilFDX7RMBQLydiXRNNN2tbCqYjnNOvsxit21ATMCr2PwsN9y5AzXgdrLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371488; c=relaxed/simple;
	bh=+mpb4A5u6+KzZjEaVLebnjWUq747ZMbiFGTj5YmPX4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nK054Gkn1OHvfDPqLKpeIc/J7FFvbeVoDj6g5Je9QnBGUmvxm0FVOye72g4LRr3w2hp7CcSfDci7ovkMoVtSSINNc77qDRWNEGBgzXREDOFwtgSLo0MxrlIGQHJdyBCG00tzRZNy0DHyr6ynYhIr3eo0hrautHEmCpYN2cBe5VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iewX+SXA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VSx9/kD2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iewX+SXA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VSx9/kD2"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ivDG3739599
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sesOnjY5IwG/EYJjr/By3L/2
	HHUhUu6qJhwhbmJkicw=; b=iewX+SXAD7uagXkBKeMj+hUwdOz7GuJ5b3PNPk9E
	zFQ/KSIyhZUD6JK83+q7uZbo3KiwGRxBNvqgjNlhJRgnPP8RdfEXTbOvgKjVHV6n
	iFcPkjTcqyuOw+AlaSi8FxR9WEJXWwzR8tOcolWQYp4Vw1MDTD5nkLhkXOqxqA0Q
	0WEpZXFwuodRkcbM6IrllBQPKHtzB4CEuP/Fda9joMqEQVbYuDQ+t7isnLwAVtco
	169gF4s9nzFqOzlmGqRh354UGI2rzKdzQi9XUWjq67fZxm/Odv4gt+QR1YC7IUuh
	CTlEWKzkapCvUHDgXWs7zcamzJEqM1e/TVEcOPs4hC5E0A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9ddj9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:38:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a1e564fd5so121223385a.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371485; x=1789976285; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sesOnjY5IwG/EYJjr/By3L/2HHUhUu6qJhwhbmJkicw=;
        b=VSx9/kD2quylb/aHTaa/aOHVjRt6adyNNPzouCpY5bfVMYd7Q2ZNMIeMv9g2sC0eeA
         MJbse/k2wHWt8k8Y5rCvWSbYlBCt+M12F8fcGosqAw2OoR50y2ZXhD3FBsplsEDHBTWL
         RMqS6VT4fKWn3SF6/KxjlXftXJfHvoTjxUGeEzLgB7Jwjrp0RAUZxNC+i4V0WeT+vjqT
         NQRxxv4SoyydQIggb40wctQI3YlwYwuYJhUMYt+OgWYlBgi3tGGElTVOkYUq5RnX5S3O
         uXdV5q1k8WJy0QCAerY+ktEwp9TuivXCr13sQ5gPbx6P/M1jbdmWsfXTcH948Ht9Ep5E
         Wr0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371485; x=1789976285;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sesOnjY5IwG/EYJjr/By3L/2HHUhUu6qJhwhbmJkicw=;
        b=lQUdM+v4Z1rJ4B/SrMk7D9a3v/Sw4JUK5C80JctY3Aa9KTEsR05tOMIU9RNnJ/L5kw
         betkF00+U8NV9NYt+orDBTbJJQq6HfSwpDRI+O1/lFahsNO5of90OTWneLVGfN/uwLJz
         jmKNTAYridsdTJHMFENAM9G3TAkNQYx6tfrlTIqHuztl308GCPxfTEVkdjxnL/6erOYr
         Zo75NtRS0F1ikr3NMwSX5SIYpDzxlHg7I6IiWnaMiMhq6vLz7C0qEfRWGANEsxF2rwqu
         XFZT57Rt9q7wirkO9nFOXMTD1OkEKSMsRItgs95aS0L3+XLj0jB50o/vdG/o5bYVBBj1
         s3Iw==
X-Forwarded-Encrypted: i=1; AKwUvBw2VaRiC3WesjAtlI/1ob5D+ah8LTCtkhgQCDBXbNMqh1EzMDHuSw35f+YDV+zrzljWO+/Fb56TifyW@vger.kernel.org
X-Gm-Message-State: AFuF++loqfnVIpNMEZSb8Y9EAfpJ2Ozmp28ALeA9ZF6YJzgxe18EWPQj
	U24qTVhXz0Cc3vcuDlukImxF7cGLrQrl+8+IrGMy7nUKIqohmqhyIM5g0zKl5o2mWEcChnq6gaW
	ZeG2ZJIduksWIkEOSS3ij+5/Afd+Rcsxv5K4p1k63JHkFL7kLshJiV9W+1Pg34ADSh7nsP5O4
X-Gm-Gg: AYBFou1Y/9Izc6ROsZwGke338CpWLDcKaQf4nsd4Yaad2WEANYtsudOvXmZf6g1RQug
	bDzcj9pWYjMgqv44b4oWST6DUvZt4zpw7EAiauzEBxo5sHO12kka/EUiEG/zidJXk+DJituZCzZ
	B7fusjJT6DjuFVkcQ6zfTMn7e1Igc/UgDLNrBOn12G6QRgETEIZC0dxuofsiMGNOaX8cs1T5xzc
	KmeJh3a8Ufw1JMbvTFY3VzyjyNy448b1GTXOgOUFEPjtrTDPwDHpL9+JU7PvAAqNjiNwf0WZ7T0
	LePO4MYsYMIijiLXnOaksI9tch4bEnfgW2u/Xx5liyY8XjHU9ncU7sYTAcuQ6vhLXUsuxGfXoRd
	DfADdmpwZ1v2K1MY=
X-Received: by 2002:a05:620a:43a1:b0:939:1222:b9f1 with SMTP id af79cd13be357-93a29448f5amr200818385a.0.1789371484781;
        Mon, 14 Sep 2026 00:38:04 -0700 (PDT)
X-Received: by 2002:a05:620a:43a1:b0:939:1222:b9f1 with SMTP id af79cd13be357-93a29448f5amr200816285a.0.1789371484322;
        Mon, 14 Sep 2026 00:38:04 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ea4fsm25999935f8f.21.2026.09.14.00.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:38:03 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:38:01 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 09/31] arm64: dts: qcom: sm6115: Add domain idle state
 names
Message-ID: <5ep34detrgxv5yhm6v5vra7e7cenzpohsf32xox2o7kr7to5mv@p7cqpwgwkul4>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-9-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-9-660c31187819@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX5TKQZbt/nT/s
 +g3eupbU6hUj7V0l4lKc/oFKQZkvoIe7rwC0HdYpGQ4V/pMAx+GPwzXPr38eRzJGieeVPPom50r
 SQ3g1e4DgPiAtxGKtAqjxfTlEuV3N5MKQdhjRILBl4QdMWNyvObtx+3IPkJLRKWeQxpuXcO7V9c
 J0UvXndYD1fDGEJBM7o1+x+CoOvkFn6O8U/1wP1qj8ZL0mKhaNkQ3HIT55EDFabPA0m+x9TGDld
 r/oMJ85pyoVGB6Q+BO6DvT3rhwdfnrZ6Z6jxQEHGxXSVUbkguDlKIZhqPTYxZaEsdhNyP7bwCdu
 hM0M/6kzFRUx5zgcqWoAwYntR4KxSPNI38tGL3YA8jmCEJL+FL2FLzn6bmiyDNXdZ/7DoRxxk/l
 m5ZoVnwB6OC4X0x+1c/fI5nt0PU2XLMMZ0phPPvACG1I2RJO+mWVPyrNulvW3+pRVBMxwKu3gBl
 rda6gwu9/Isp4Pr0Mdg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX6slClEsuFMl7
 Fz2ZePls9L3TIW1FlLW/3V35ajHHngFXu+sK2/41hRAamR33oN6pO9CPtxHq/dzZJTdFzwgHGqP
 eYXt74AdUKqbyjXEGH+3KdNTTIZ89z8=
X-Proofpoint-GUID: A1kSritr_YYbnJYB31cWFTC3-674ID8q
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa7a45d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: A1kSritr_YYbnJYB31cWFTC3-674ID8q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140106

On 26-09-14 12:29:41, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
