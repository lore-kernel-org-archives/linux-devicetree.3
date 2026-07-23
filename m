Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F2878C9C;
	Thu, 23 Jul 2026 13:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784814324; cv=none; b=uGHvBHxIMRDSOVzErAP9mNk1J0U2/5IkruNhJItIBrtlHXDXuD7iTStWzr9ynnCXulpv2V6Mz12F7PS6inwTLl86rELsJ9VewCRdVYTKVRt0cyFDKjNm9eDgJUcVyuwcyHgqbPLOz3NqJg6EPiw8NJwIZupQnO5Okgxp/bgb1KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784814324; c=relaxed/simple;
	bh=jZax3IQ5T1OEn5br3cNYEko9rDQD904YZonZkdO9z00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FbPkLGXo6VSB2X6sr/mlgHyfsoyVP7Ikt+T1InwVShojyLnBvm8060Ccv5L44w9MPOm7quuqpNCrEgDGd6KXts5sUmBZKUJ/lqau9ktduZfi6uYpbb5HL6NHbdQK6oYWY6jq2vfzbvoqSob9QUQuJhuoZn59QfYum0ygr0ZoruI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD0FA1F000E9;
	Thu, 23 Jul 2026 13:45:18 +0000 (UTC)
Date: Thu, 23 Jul 2026 14:44:47 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
Cc: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>, ulfh@kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/12] coresight: Add CPU cluster
 funnel/replicator/tmc support
Message-ID: <20260723-light-aardwolf-of-swiftness-1c46ea@sudeepholla>
References: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
 <20251218-careful-ruby-wildebeest-a8babd@sudeepholla>
 <d0ce8306-84e0-4940-98aa-dbc356d87593@oss.qualcomm.com>
 <20251219-hysterical-sparkling-meerkat-59c5eb@sudeepholla>
 <11a01108-63da-4317-a547-5977a469a7dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <11a01108-63da-4317-a547-5977a469a7dc@oss.qualcomm.com>

On Mon, May 25, 2026 at 06:47:27PM +0530, Maulik Shah (mkshah) wrote:
> 
> 
> On 12/19/2025 3:51 PM, Sudeep Holla wrote:
> > On Fri, Dec 19, 2025 at 10:13:14AM +0800, yuanfang zhang wrote:
> >>
> >>
> >> On 12/18/2025 7:33 PM, Sudeep Holla wrote:
> >>> On Thu, Dec 18, 2025 at 12:09:40AM -0800, Yuanfang Zhang wrote:
> >>>> This patch series adds support for CoreSight components local to CPU clusters,
> >>>> including funnel, replicator, and TMC, which reside within CPU cluster power
> >>>> domains. These components require special handling due to power domain
> >>>> constraints.
> >>>>
> >>>
> >>> Could you clarify why PSCI-based power domains associated with clusters in
> >>> domain-idle-states cannot address these requirements, given that PSCI CPU-idle
> >>> OSI mode was originally intended to support them? My understanding of this
> >>> patch series is that OSI mode is unable to do so, which, if accurate, appears
> >>> to be a flaw that should be corrected.
> >>
> >> It is due to the particular characteristics of the CPU cluster power
> >> domain.Runtime PM for CPU devices works little different, it is mostly used
> >> to manage hierarchicalCPU topology (PSCI OSI mode) to talk with genpd
> >> framework to manage the last CPU handling in cluster.
> > 
> > That is indeed the intended design. Could you clarify which specific
> > characteristics differentiate it here?
> 
> Sorry for coming very late on this.
> 
> This series is intended to handle coresight components which resides within CPU cluster.
> For the cases where cluster is in deepest idle low power mode or all CPUs belonging to cluster
> are hotplugged off, access to coresight components can not be done.
>

Sure, but the question is why is the cluster entering deepest idle state if
coresight is in use ?

> The implementation tried to address in two parts,
> 1. Using cluster power-domain to know which coresight component belongs to which cluster/CPUs

OK

> 2. Schedule the task on intended cluster's CPU to make sure the CPU (and cluster) power is
> ON while coresight component of the cluster is being accessed (using smp_call_function_single()).
> 

Why, just block any cluster entering deeper idle state when corresponding
coresight component is in use. This should be taken care automatically.

> The use of power-domains in (1) will limit this to PSCI OS-Initiated mode,

Yes

> to have this support on PSCI Platform-Coordinated mode too, probably instead of power-domains,
> cpu-maps (which also defines the clusters) from device tree is a better choice which will give
> the information on which CPU belongs to which cluster.
> 

No, let the platform deal with it. And the whole OSI mode was pushed giving
such use-case as example and now you are telling you want to solve the problem
for PC mode. I am confused. Just use OSI.

> (2) ensured that scheduling happened on intended CPU and while the access is in progress, CPU (and
> cluster) will not enter power down in between.
> 

No, just block entering that state in OS(for OSI) and in the platform(for PC)

> > 
> >> It doesn’t really send IPI to wakeup CPU device (It don’t have
> >> .power_on/.power_off) callback implemented which gets invoked from
> >> .runtime_resume callback. This behavior is aligned with the upstream Kernel.
> >>
> > 
> > I am quite lost here. Why is it necessary to wake up the CPU? If I understand
> > correctly, all of this complexity is meant to ensure that the cluster power
> > domain is enabled before any of the funnel registers are accessed. Is that
> > correct?
> 
> Yes, This is to ensure that CPU (and cluster) power is ON while coresight components
> for same cluster are being accessed.
> 

Or just don't turn off cluster if coresight is enabled and in use.

> > 
> > If so, and if the cluster domains are already defined as the power domains for
> > these funnel devices, then they should be requested to power on automatically
> > before any register access occurs. Is that not the case?
> 
> Cluster power-domains will be only available for PSCI OS-initiated mode but also
> will not help for cases where all CPUs in cluster are hotplugged off as hotplugs are
> platform coordinated.
> 

See above, let platform deal with it. It is called PC for that reason.

> After discussion with our HW team to automatically request power on for coresight
> component GPR [1] can be used but they seems not working as intended on the existing
> SoCs and will be available on next generation SoC.
> 
> [1] https://developer.arm.com/documentation/ddi0480/d/Functional-Overview/Granular-Power-Requestor
> 

You are looking at it from wrong side as you allowed cluster to power down
when the coresight in the cluster power domain was still in use, right ?

> > 
> > What am I missing in this reasoning?
> > 
> > The only explanation I can see is that the firmware does not properly honor
> > power-domain requests coming directly from the OS. I believe that may be the
> > case, but I would be glad to be proven wrong.
> > 
> 
> please see below comment for more details, This seems not a firmware issue.
> 
> >>>
> >>>> Unlike system-level CoreSight devices, these components share the CPU cluster's
> >>>> power domain. When the cluster enters low-power mode (LPM), their registers
> >>>> become inaccessible. Notably, `pm_runtime_get` alone cannot bring the cluster
> >>>> out of LPM, making standard register access unreliable.
> >>>>
> >>>
> >>> Are these devices the only ones on the system that are uniquely bound to
> >>> cluster-level power domains? If not, what additional devices share this
> >>> dependency so that we can understand how they are managed in comparison?
> >>>
> >>
> >> Yes, devices like ETM and TRBE also share this power domain and access constraint.
> >> Their drivers naturally handle enablement/disablement on the specific CPU they
> >> belong to (e.g., via hotplug callbacks or existing smp_call_function paths).
> > 
> > I understand many things are possible to implement, but the key question
> > remains: why doesn’t the existing OSI mechanism - added specifically to cover
> > cases like this solve the problem today?
> > 
> > Especially on platforms with OSI enabled, what concrete limitation forces us
> > into this additional “wake-up” path instead of relying on OSI to manage the
> > dependency/power sequencing?
> 
> + Ulf in loop.
> 
> Current platforms with OSI enabled, Linux PSCI do not implement the power_on/power_off
> requests, as far as i know, runtime PM was never meant to implement this part and
> pm_runtime_get_sync() (from drivers/cpuidle/cpuidle-psci.c) call is only used to convey
> to cluster power domains about a child CPU/ sub domain being on after it has already
> been landed in Linux.
> 

When a shared power domain has one of the consumer active, why is the power
domain being turned off. OSI is supposed to handle that, I still don't
understand what am I missing ?

> The standalone invoke of pm_runtime_get_sync() from another CPU do not really turn on/get
> the CPU (and cluster), as the CPUs either use CPUidle / CPU hotplug paths to enter/exit
> low power mode.
> 
> To put it other way,
> For a hot-plugged off CPU, invoking a pm_runtime_get_sync() won't get the CPU (and make
> its cluster power domain) ON. In order to turn on the CPU, one has to still request
> the online of the CPU, say via sysfs command echo 1 > /sys/devices/system/cpu/cpuX/online
> which would invoke PSCI CPU_ON function and the power domain for CPU gets marked as ON
> only after CPU already landed in Linux via psci_idle_cpuhp_up() invoking pm_runtime_get_sync().
> 
> I used specific hotplug example but same applies to idle powered down CPU (or Cluster) too.
> 

Deny hotplug or deeper idle state if the CPU/cluster shares power domain
with other device or components(like coresight) when active. Or fake hotplug
and keep it alive in the platform firmware.

-- 
Regards,
Sudeep
