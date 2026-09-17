Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C254439A7E1
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658478; cv=none; b=DgIGwUZgXI52gZVHHifaGapyHLiP5WQ8fnExe5jbLigAWJagU8Ii//H1SHTqPRxwPuXxPKMNKH/Cxp1+YbHmhIbD8tD6MrlsZlxmXUWghHEGJ0Ezf63vkHV7Njox0TlMc5prBlQdxBUP+PR0S9igfLsOHQeu7PhqdXg8WHdHxrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658478; c=relaxed/simple;
	bh=twrgboY+FGQmnsHlBPho3Q6UZGpTdmrg5WyreHCXpw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iIkA/Ow8YsTAyTWzs9cyLZ1xmNxr+P0wb9bCi6nxjjWA2xBsbX7bsrxAXh4Srg0QytuszXnvAJd7Gtnwcden1s9f2FBeWbzDJMQhQlws49PYnz/LtVmhwwvDbltHKnDRlCguCpW0NWYLeY7QM8O7e3ktSM6pjfwmVFOy5JqVRwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VELQo9br; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b98Nm+le; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VELQo9br";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b98Nm+le"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDiRk42265057
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/tTW+lLwHomb6oSOol9clHo+
	Od6D7SaNe+Gbi8U5oxI=; b=VELQo9brRFGtw8IueZoNq4B0AdZhmVoNKND+Cnsq
	cb8hPrgnbgtKLsYNu3YcasMGXlubsgn68qzsfrAwcayO5YwThR8QdFJCm58jw9xi
	nuXyQNzYzFeZ4w7jL4RPkfXy9cHpNMhwx4IhHE8eLmyRzzUQhnMioDnxAbbKfSFQ
	Gv6ScnRKWAvL4KkcwalF/MhCy6OF0cPSFIyfWn/qwoJWncigxda/DUm0CVz8O7VO
	qneFxFL/RZn9tNSU3hiLNoWGp9krqVm2xRb1tWczizdAaDl7IffprzwHTG4MXdrH
	uSwmtGLGNQrGcnDnAgRK3IJZZslgeoES7tLYcJwKm1JvWA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfppgyyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:21:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c26012cd0so18480791cf.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658461; x=1790263261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/tTW+lLwHomb6oSOol9clHo+Od6D7SaNe+Gbi8U5oxI=;
        b=b98Nm+lePUNg2PLFUj93k6QL2U61jXjyvU1VKo/Idl0u5HN/0HUQh5KNReK55m+vlB
         InLO7u3WO23AaK+u0J3becLhUIudA3W9jfSg+c6wniX21EdFHfIEjumTMJi15o3XPG1X
         TA3gSOPN+wzGL2mmpDnxDDqqp4eDwVoH/JwROzlLzfFvf3bwLASg1UTzdVekQl/H40GH
         0uUrBZ4ueG09gI5psYMbV4Aib0RF99g2YIh3B2uh5fs5z4kdZRK0sJ/ZlRWqn9MGM6bH
         ivTrf1zi9GXS4D8BCdEf70z5YsX8z8Dy+VdvTH9fe7OICleiRJStY1xASBdb63wzvJva
         itIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658461; x=1790263261;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/tTW+lLwHomb6oSOol9clHo+Od6D7SaNe+Gbi8U5oxI=;
        b=JagX8DSVxX8HJR3wG14vCdHfYFWuUH5kW/YvO7C+vUPywzI9V/kqBVj6bL9zJr1Lan
         rEPgsMk5sVJoIeuSVxPqKpwQ/gUeoBQkF6L2zqOW7IYnJWOBJTU3Akhx7ohsKIvKI1ya
         d/IDmS97iHtiOSH4eegc+HbzZM4Pbqw1JhACA6N2mVeGbu9gQMyvyRJP5LOX4UTo3wcU
         Ea75Jzg+cfK7VUQnNtQMwCSUcdDZffkh9e32a1HFDBRT+8GZl1pfnqsnqVTNv/AbFo/I
         knRR1btWMFjIX2XArudbCTdEM43nokelYVjqNixukxtLpi1mkoPPJZD1t28zP8CCTE6E
         Qt5g==
X-Forwarded-Encrypted: i=1; AKwUvByAz+N0qQhlr3WXsVE+KZiAqxYiPq+WTNm1STXszg8xdrFzYsUEAvZiIo+upy8D1/w0JWXLL7EszDDr@vger.kernel.org
X-Gm-Message-State: AFuF++nOZnmYFGJ9wPN29LCmfkjC24AnIP5Q3tfbyabtkJp7phkHdsTU
	tCYoRf+WaZXUzkhHSG0ajp0OAPx9LtDX4jy4waZl6xc9PnPbgA+mXjpNke12WAMA7VpfW4msaiE
	j26GS1sPJuOFaNH1DY2uPz3jV8zf9p2FYt5Uiu5smjoCLEQ1i9YL/ITY/XGUlXDsl
X-Gm-Gg: AYBFou1XaX23xWcGxy/2se6RB1TU7fr365AQTjhzjU0CjZ03Wcl9K7DgI2wJGco2Uxn
	1U4zLi+PhkGkFEJKCR3U5wD+s5dVOgTb+Sujm/qMk/hCt+dzEtVvjiTzERUPsoE4d2qsCbgkTIK
	p0RdyeZ/SaBAQ9emE2d1D/so5kly2ijjtEEr3tnfkxDddKlkWtLKihPD473Z3CVerqVKjUcqq7Y
	p3jZ4SdIhTKR5zP3uYnSUwi8NSHLFOtSE7hx7vDlDqFn2W7Rbiui11EprlETYTo20IJvosHbdLT
	7eQoCPKkQ1ueX9j33LIwsl7iK8hhIzB8m3w2+9s8zaAmcoLPljtJcYsLC8QigG9KBYPVglP5bEg
	moX+9WzL9RSISS/U=
X-Received: by 2002:a05:6214:5017:b0:912:517c:119 with SMTP id 6a1803df08f44-912517c08e4mr12930776d6.57.1789658461280;
        Thu, 17 Sep 2026 08:21:01 -0700 (PDT)
X-Received: by 2002:a05:6214:5017:b0:912:517c:119 with SMTP id 6a1803df08f44-912517c08e4mr12929806d6.57.1789658460638;
        Thu, 17 Sep 2026 08:21:00 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27198sm16392480f8f.15.2026.09.17.08.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:20:59 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:20:57 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: glymur-zenbook-a16: Add Embedded
 Controller
Message-ID: <j74fubwlkynw22nwsof3wylypf77ptrwbg64q6tmldvh7ckq7r@6nsl5fgiut3r>
References: <20260917-topic-asus_ec-v1-0-373516d347ae@oss.qualcomm.com>
 <20260917-topic-asus_ec-v1-3-373516d347ae@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-topic-asus_ec-v1-3-373516d347ae@oss.qualcomm.com>
X-Proofpoint-GUID: stFtwTR-qC5yUrsPaYp_Icpd22bvqoWb
X-Authority-Analysis: v=2.4 cv=YcYodARf c=1 sm=1 tr=0 ts=6aac055e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=-FifcBtKAQNI-ioUATQA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: stFtwTR-qC5yUrsPaYp_Icpd22bvqoWb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNyBTYWx0ZWRfX8T+eAtfQ8o3D
 OgluLYfIsZkOBEV2RABAC7nZj/wnH9Zaoxjs/1lWW6ajsXxPDSI4O2a36etsTrn6GIKW+qYb8Le
 DKUKSXAMns9fL4hMNAXwDxb/pQ6K8o4isBYDcjtsuFOF9tukQET+bhH2MQrV/NdJiXH30Vr7vpT
 U36SE6t+OFGlBvP/NyxJi4iTiO/gIBmIqsRLEZ7eHqGzIc+qk33tSIiqfi6bWrrqMkna2oOWeyq
 Dapq4dGiJdt15FzR0eu7EFddtOQ4xoGTGGmbdLFhVVdIvcMIkDXBOuXx5T9AgOu9MeIO24cDNSp
 n1PaTnUXa8f//UXrUL00ipK+lvqhRdJgegIhL5vUuLZtFxuf0fwro0CGvtnYcVR0HH62Kqctocc
 N8kONV1I+xzm4VgKfVSQKxUnW/NooU1JZFXXijIZB8rpotPLcwxSp0OQYrkQSIZekpC0g72T8Lq
 E9qhrIlB6FYTyd0ZOzA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNyBTYWx0ZWRfXzPlyYApVpdr3
 sckZmeaeRsU6GbYYlBSyvgOZ61d2kF7HrREQXQelhu2e5mpUXDM08OI2d5AoCTu3homgW94yXBV
 +YsmtIU64KHpZbfvWxtQ6Uh1TInsHp4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170217

On 26-09-17 12:54:58, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The Glymur-based Zenbook A16 features an Embedded Controller running
> custom ASUS firmware (which is loosely based on the reference Qualcomm
> Hamoa EC one with a lot of modifications). It provides keyboard
> backlight control, additional temperature sensor readouts, fan speed
> monitoring and a number of miscellaneous functions.
> 
> Describe it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
