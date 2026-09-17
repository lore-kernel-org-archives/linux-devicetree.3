Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8441A6822
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658167; cv=none; b=ck2Jx1iVtNih0WMWuZ1XPz2YNI5OAlu6ejbAYyp2trZuDJnmkXqKk8SEV2x9pgYBRe0H/aigRdUKzyg+uPkLehOnN05gPLYLr77tbwJ+snzK75oPRNGdObQJpquETCzYGR/jvtY3wHLsKieYak2KXeAnyQ7dqQvRqj74factM0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658167; c=relaxed/simple;
	bh=mN/y5gkJ1eIeT/23li5ZAE6Vdcj+otr5+S74JJYPlzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YqCNPNyFpmjSQlYzLmBe/2nXFvf/3KYAcCDfQF46+EXucMxvg/cLM8fXYphVjsVmSzdNXZvzqEVG5EXFYWZPf1yQ8ev7daMcejDeZCAKEYMD8Ffk52I4XRkkwZEO5V+C/qEOyjBININXYoH/gzsyz8KCX/2pds/R3a75aWQ9Tfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q4DA+xHp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UFOA078w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q4DA+xHp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UFOA078w"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HF9wOE2024669
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U+s9oHZn49sNcqeY9P4zWOZp
	N1WVw8/WixsEhkKlvqU=; b=Q4DA+xHpdwVH5OiCoVH3SIS4BSvh1opGgyqJnG3B
	2Q8KQjNM6tSXNBeM06SwqG/mihISOkN7+Jda1KHAwZG/hI0lcvKYOjopKSTf6qz6
	GoZDbTtQBSWWM16wP0BHHSLEbqGoCLRfHLbWUZ41aPy2E+sAJZfAq+OsZ4ZsfUEd
	zN/GkFC10sgUApJlx0ulaxb7Ur97xcPvPmyiu/2WZRjciejnwQkrMCJGrlZId3NZ
	8LssZCdBkSS9ggNay4UpYUm8iW/obp+MlIYn5n1WDIOYJe7ctkLCnhnGFx153bXG
	huHY+JVaSbJo+oNPCSSIAFEM03olS1Km/sSP+mi03InhmA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grjkt00yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:15:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a1b824e84so222309685a.2
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658141; x=1790262941; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U+s9oHZn49sNcqeY9P4zWOZpN1WVw8/WixsEhkKlvqU=;
        b=UFOA078wx4hc8rptQH8cPD+j8gaq5j6mXPLPXybNB1QX4oT1QM9pWC/bxnj5+0nLwo
         eoAIABTuftAdGTsDibweKUjxpJ4ECyLsTLOT4DDMZOHBa78tECjHnr66sw++N6Q8I4iK
         A1XIPwUbLoAgIf3gTH74vD9SzhE37VoS0U/OMT3afaGVequss+47fvRpLDMFeCkrP6SI
         4vC5Ct2FQ71dlGqvzljgTukUFnZQxfrMb2EbTjLHEoopkHA62MdUeZvlR6ndIjTLUKTt
         Ep4nUhZHFD5QVg4B1nRrWnpQ3/6zsoU8A8jv2OrcKrEkbZqdbETnIqaJ7JjMe09gQp/L
         NzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658141; x=1790262941;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U+s9oHZn49sNcqeY9P4zWOZpN1WVw8/WixsEhkKlvqU=;
        b=o7I97N5cVjhLcEn/jvdMFpIxNbLoxN0fgDWnK52dMLWF1fxs8a3MoO8TkJoMSSrFwO
         +zR6W/sXSNy8NT/5/jfJrKj7xRS/uozShDN1bz70kLWbO7Goa45AYrOcUac0o6xDQM5J
         P4WdcWTsnnRtk+Sg++yPoexJZ/iYPJfV5x+XoWPViTspeXEpwN/NiyHjjGMQqlD5i/aC
         t4cmCY4HlKrV65qzTVSFKYAykwE+RQoXXBQ+JGPQFfpR3rerDuI9ETsXK0C54vq/sefy
         leeElefQg4GT4mP5WKwYQJkUowvBjjMgXMYxn0m6FCiGMfQ+P05LQB0IxJJwXLSZKuVZ
         d9JQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzj2uv2VBtQrRBZw0i89D/Jtx3SEYC7FAbAuROSFtphmCXXzGcA4mtOjggb7fOKVxCzWxvX0R1w8GX@vger.kernel.org
X-Gm-Message-State: AFuF++lWrLNkJjZbnDrhJyUwD4y4CmELLcthR/cNkaCdagIuNGDZfWnH
	5aARt75tTgVmZcpWuIeN4hV2n2zzfUvyeNMo0IIsyEt+PlnDyTViZ1oZkgq97lGB1xx6t4guPuK
	5I4bpOvAIY/S9A0wWtQThq6mqTJLoS8wbFr4F34L2FHlmAf+ubMbaLdC5G5z5KsY5
X-Gm-Gg: AYBFou2OLNgdjRJUHJtcwzJJXDcNl3W9sPc2f0za72AXVsCpYwoAzwr4KwAeLyTLsXO
	Er4JC4g3Fe72gfIw8T/sFO+J/4gMPSli1eMVKxsA7BTjTFltcXNIbCk2gucTKnaumNuAk9NUwv5
	jDQpCLn6BpWGz+691cTwybYd6lckaVU3X6gGYst7vgbkeEguGuy4jwfTP+czflCLKE0LE5vbT8T
	f2PPXG9ZfI0V3eJi3eInKZrIAQeV0s2FV5fqmOqUpb27AMpjQTKcn6E0cMwimUpaKkBeuAu6RF1
	4FKRVm/Fe6LA2ZL6vQwcWVPBotKAqV/+mnPqTcVS8v+b7eJhvQnnE7FoQR/TC0M+DqxqMcCQTNj
	k6iIHMHyqFgy62Q==
X-Received: by 2002:a05:620a:4725:b0:93b:d7b4:a43 with SMTP id af79cd13be357-93bd7b41171mr110245085a.77.1789658136271;
        Thu, 17 Sep 2026 08:15:36 -0700 (PDT)
X-Received: by 2002:a05:620a:4725:b0:93b:d7b4:a43 with SMTP id af79cd13be357-93bd7b41171mr110234085a.77.1789658135590;
        Thu, 17 Sep 2026 08:15:35 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e847e994dsm113950375e9.2.2026.09.17.08.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:15:34 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:15:32 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 13/15] arm64: dts: qcom: msm8996: Move PCIe phy and
 GPIOs to root port node
Message-ID: <lgv4hrhmvgetmiskf2j5rihn2r4rtpzlwnsb6rz6peiqe6t5kn@li5kt3psjw5p>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-13-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-13-6272b7caae9a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfXw+kzJIDjEWsz
 xo2d5F0cR1QWqw4GjeUeV5iS0wx2MqYjdv80rQ3M5bvNOeMMPUuZnN0hXyn1blwjl8ZL7/jRYW6
 IYV/7GKhLc8Rkwo5BCxmRw2+4JpgNf3MOMfVLM4/sBeniZ4Atng01YHOmu1dk7MFo3UpOe698cS
 GZK7e0dzn7e/nIAZCl55Us7xXzDZ0wDU36CrkVCdUjJzqYcotEvJXtXSRacCMaCqxgqgAIRwGLW
 32UH0rZYyurBQ9LV8iLFy+ddFumzHfhiwfxyd6Rl3BCGyuZ7xJJZ6lhR5D7PX46PSY/5I0u0EzT
 cht4KJoRSMp1jFB8ON8m/jWQFTurDHqf5xK0+3f4J+MKyLYgOCWZjZz8GyU2EET3yHAMcxPOhf8
 VY9+8pWe0KTbdIIzJdQzQx/kqOHPwTuIh6Gd3RrpE6ioyXkk4lLi8hywL1LhrIZKhVRBWxkJwo3
 MBnhT1PqqhXHSrf6R7w==
X-Proofpoint-GUID: kmQEB7lh5g8uUWMyG4gU2_qsBhc1HBK0
X-Proofpoint-ORIG-GUID: kmQEB7lh5g8uUWMyG4gU2_qsBhc1HBK0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfXwzzkNDbibTOr
 LgQKEIgrfQssDKZ52uGztRbZJSifSMpv95Udt0yHXOzzs4cX4mZUGFXuQHGzN9z9/7HVUdEDnlF
 E+ce6kw59ORlLLHw1Z7zI9aNbXTHFOc=
X-Authority-Analysis: v=2.4 cv=Y/VtIReN c=1 sm=1 tr=0 ts=6aac041d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170216

On 26-09-17 17:55:27, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> pcie0_port0, pcie1_port0, and pcie2_port0, adding labels to these
> nodes to allow board-level overrides. Move perst-gpios/wake-gpios
> from the controller overrides to the respective port nodes in the
> board files, renaming perst-gpios to reset-gpios to match the binding
> used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
